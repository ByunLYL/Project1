class AddHealthDataToWeather < ActiveRecord::Migration[7.2]
  def change
    add_reference :weathers, :health_data, null: false, foreign_key: true
  end
end
