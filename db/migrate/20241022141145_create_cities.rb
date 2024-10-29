class CreateCities < ActiveRecord::Migration[7.2]
  def change
        puts "Creating 3"
    create_table :cities do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
