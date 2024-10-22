
class Weather < ApplicationRecord
  # Each Weather record belongs to one HealthData region
  belongs_to :health_data

  belongs_to :city  # New association

  validates :city_name, :temperature, :humidity, :wind_speed, :weather_condition, :timestamp, presence: true
end
