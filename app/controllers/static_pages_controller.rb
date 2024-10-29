class StaticPagesController < ApplicationController
  def home
    @cities = City.all

    if params[:query].present?
      # 使用 LOWER 以便在 SQLite 中实现不区分大小写的搜索
      @cities = @cities.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    end

    if params[:region].present?
      # 根据 region 字段进行筛选
      @cities = @cities.where(region: params[:region])
    end

    # 分页
    @cities = @cities.paginate(page: params[:page], per_page: 10)
    @health_data = HealthData.paginate(page: params[:page], per_page: 10)
  end
end
