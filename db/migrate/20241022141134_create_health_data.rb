class CreateHealthData < ActiveRecord::Migration[7.2]
  def change
        puts "Creating 2"
    create_table :health_data do |t|
      t.string :region, null: false
      t.integer :year, null: false
      t.float :disease_prevalence, null: false
      t.float :vaccination_rate, null: false
      t.integer :healthcare_availability, null: false

      t.timestamps
    end
  end
end
