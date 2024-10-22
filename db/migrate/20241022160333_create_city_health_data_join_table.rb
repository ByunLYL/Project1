class CreateCityHealthDataJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :cities, :health_data do |t|
      t.references :city, null: false, foreign_key: true
      t.references :health_data, null: false, foreign_key: true
    end
  end
end
