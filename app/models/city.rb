class City < ApplicationRecord
  # A city can belong to multiple health data regions
  has_many :city_health_data, dependent: :destroy
  has_many :health_data, through: :city_health_data

  has_many :weathers, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :state, presence: true, length: { maximum: 100 }
end
