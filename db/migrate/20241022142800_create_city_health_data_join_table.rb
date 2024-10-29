class CreateCityHealthDataJoinTable < ActiveRecord::Migration[7.2]
  def change
        puts "Creating 6"
    create_join_table :cities, :health_data do |t|

    end
  end
end


