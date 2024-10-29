class HealthDataController < ApplicationController
  def show
    @health_data = HealthData.find(params[:id])
    @city = @health_data.city
  end
end
