class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @health_data = @city.city_health_data.map(&:health_data)
  end
end

