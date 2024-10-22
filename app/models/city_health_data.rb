class CityHealthData < ApplicationRecord
  belongs_to :city
  belongs_to :health_data
end
