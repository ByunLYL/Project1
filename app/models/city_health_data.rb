class CityHealthData < ApplicationRecord
  belongs_to :city
  belongs_to :health_data

    # Validations
    validates :city_id, presence: true
    validates :health_data_id, presence: true
end
