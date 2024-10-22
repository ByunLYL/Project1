class City < ApplicationRecord
  # A city can belong to multiple health data regions
  has_many :city_health_data, dependent: :destroy
  has_many :health_data, through: :city_health_data

  has_many :weathers, dependent: :destroy

  validates :name, :state, presence: true
end
