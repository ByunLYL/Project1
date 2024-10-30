# app/controllers/static_pages_controller.rb

class StaticPagesController < ApplicationController
  def home
    @cities = City.all
    @health_data = HealthData.all # 确保 @health_data 被初始化

    if params[:query].present?
      # 使用 LOWER 以便在 SQLite 中实现不区分大小写的搜索
      @cities = @cities.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")

      # 调用 World Cities API 获取城市信息
      cities_service = WorldCitiesService.new(ENV['WORLD_CITIES_API_KEY'])
      api_cities = cities_service.search_cities(params[:query])

      # 合并 API 返回的城市数据
      if api_cities.present?
        api_cities.each do |city|
          # 确保只添加新城市（假设你只想添加城市到 @cities 变量中）
          unless @cities.exists?(name: city["name"])
            @cities << city
          end
        end
      end

      # 获取天气信息
      weather_service = OpenWeatherService.new(ENV['OPEN_WEATHER_API_KEY'])
      @cities.each do |city|
        if city.is_a?(Hash) # 如果是 API 返回的城市数据
          city["weather"] = weather_service.fetch_weather(city["name"]) if city["name"].present?
        else # 如果是数据库中的城市数据
          city_weather = weather_service.fetch_weather(city.name)
          city.instance_variable_set(:@weather, city_weather) if city_weather
        end
      end
    end

    if params[:region].present?
      # 根据 region 字段进行筛选
      @cities = @cities.where(region: params[:region])
    end

    # 分页
    @cities = @cities.paginate(page: params[:page], per_page: 10)
    @health_data = @health_data.paginate(page: params[:page], per_page: 10) # 确保分页
  end
end
