
class HealthData < ApplicationRecord
  has_many :city_health_data, dependent: :destroy
  has_many :cities, through: :city_health_data
  # A region in HealthData can have multiple weather records (cities)
  has_many :weathers, dependent: :destroy

  validates :region, :year, :disease_prevalence, :vaccination_rate, :healthcare_availability, presence: true
end