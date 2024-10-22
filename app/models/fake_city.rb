class FakeCity < ApplicationRecord
  validates :city_name, :region, presence: true
end
