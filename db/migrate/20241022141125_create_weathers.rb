class CreateWeathers < ActiveRecord::Migration[7.2]
  def change
    create_table :weathers do |t|
      t.string :city_name
      t.float :temperature
      t.integer :humidity
      t.float :wind_speed
      t.string :weather_condition
      t.datetime :timestamp

      t.timestamps
    end
  end
end
