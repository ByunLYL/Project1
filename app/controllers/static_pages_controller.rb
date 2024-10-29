class StaticPagesController < ApplicationController
  def home
    @cities = City.all
    @health_data = HealthData.all
  end
end

