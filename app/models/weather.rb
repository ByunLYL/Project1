
class Weather < ApplicationRecord
  # Associations
  belongs_to :health_data
  belongs_to :city  # New association

  # Validations
  validates :city_name, presence: true, length: { maximum: 100 }
  validates :temperature, presence: true, numericality: { allow_nil: true }
  validates :humidity, presence: true, numericality: { allow_nil: true }
  validates :wind_speed, presence: true, numericality: { allow_nil: true }
  validates :weather_condition, presence: true, length: { maximum: 50 }
  validates :timestamp, presence: true
end

