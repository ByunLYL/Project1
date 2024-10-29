class AddHealthDataToWeather < ActiveRecord::Migration[7.2]
  def change
        puts "Creating 5"
    add_reference :weathers, :health_data, null: false, foreign_key: true
  end
end
