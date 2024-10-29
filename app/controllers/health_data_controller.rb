class HealthDataController < ApplicationController
  def show
    @health_data = HealthData.find(params[:id])
    @city = @health_data.city # 假设 HealthData 与 City 之间有一个关联
  end
end
