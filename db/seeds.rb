# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing records
HealthData.destroy_all
City.destroy_all
Weather.destroy_all
CityHealthData.destroy_all

# Load health data from CSV
require 'csv'

# Read health data from CSV file
CSV.foreach(Rails.root.join('db/health_data.csv'), headers: true) do |row|
  HealthData.create!(
    region: row['region'],
    year: row['year'].to_i,
    disease_prevalence: row['disease_prevalence'].to_f,
    vaccination_rate: row['vaccination_rate'].to_f,
    healthcare_availability: row['healthcare_availability'].to_i
  )
end

# Generate fake cities and health data using Faker
5.times do
  city = City.create!(
    name: Faker::Address.city,
    state: Faker::Address.state
  )

  # Associate each city with a random health data entry
  health_data = HealthData.order('RANDOM()').first
  CityHealthData.create!(
    city: city,
    health_data: health_data
  )

  # Generate random weather data for each city
  Weather.create!(
    city_name: city.name,
    temperature: Faker::Number.between(from: -10, to: 40),
    humidity: Faker::Number.between(from: 0, to: 100),
    wind_speed: Faker::Number.between(from: 0, to: 20),
    weather_condition: Faker::Weather.description,
    timestamp: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

puts "Database seeded with health data, cities, and weather!"
