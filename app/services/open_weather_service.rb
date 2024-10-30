# app/services/open_weather_service.rb
require 'httparty'

class OpenWeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize
    @api_key = '32ec85ff88d0bb2b5b648beab93a96a6'
  end

  def fetch_weather(city_name)
    response = self.class.get("/weather", query: { q: city_name, appid: @api_key, units: 'metric' })
    response.parsed_response if response.success?
  end
end
