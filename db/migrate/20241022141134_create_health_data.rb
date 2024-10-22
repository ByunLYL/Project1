class CreateHealthData < ActiveRecord::Migration[7.2]
  def change
    create_table :health_data do |t|
      t.string :region
      t.integer :year
      t.float :disease_prevalence
      t.float :vaccination_rate
      t.integer :healthcare_availability

      t.timestamps
    end
  end
end
