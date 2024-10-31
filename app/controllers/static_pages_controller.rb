# app/controllers/static_pages_controller.rb
class StaticPagesController < ApplicationController
  def home
    @weather_data = Kaminari.paginate_array(WeatherService.fetch_canadian_cities_weather).page(params[:page]).per(10)

    if params[:query].present?
      @cities = City.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%").paginate(page: params[:page], per_page: 10)
    else
      @cities = City.paginate(page: params[:page], per_page: 10)
    end
  end
end
