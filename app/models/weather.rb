
class Weather < ApplicationRecord
  # Each Weather record belongs to one HealthData region
  belongs_to :health_data

  validates :city_name, :temperature, :humidity, :wind_speed, :weather_condition, :timestamp, presence: true
end
