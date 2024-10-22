
class HealthData < ApplicationRecord
  has_many :city_health_data, dependent: :destroy
  has_many :cities, through: :city_health_data
  # A region in HealthData can have multiple weather records (cities)
  has_many :weathers, dependent: :destroy

  # Validations
  validates :region, presence: true, length: { maximum: 100 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 2000, less_than: 2100 }
  validates :disease_prevalence, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :vaccination_rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :healthcare_availability, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end