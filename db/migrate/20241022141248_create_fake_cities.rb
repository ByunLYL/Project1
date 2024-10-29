class CreateFakeCities < ActiveRecord::Migration[7.2]
  def change
        puts "Creating 4"
    create_table :fake_cities do |t|
      t.string :city_name
      t.string :region

      t.timestamps
    end
  end
end
