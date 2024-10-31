class WeatherService
  BASE_URL = "https://api.openweathermap.org/data/2.5/weather"
  API_KEY = "32ec85ff88d0bb2b5b648beab93a96a6"

  def self.fetch_weather(city_name)
    uri = URI("#{BASE_URL}?q=#{city_name},CA&appid=#{API_KEY}&units=metric")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.fetch_canadian_cities_weather
    canadian_cities = ["Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa", "Edmonton", "Quebec City", "Winnipeg", "Hamilton", "Kitchener", "Gatineau", "Burnaby", "Saskatoon", "Kitchener", "Halifax", "Regina", "Oshawa", "Barrie"]
    weather_data = []

    canadian_cities.each do |city|
      data = fetch_weather(city)
      if data["cod"] == 200
        weather_data << {
          city_name: data["name"],
          temperature: data["main"]["temp"],
          humidity: data["main"]["humidity"],
          wind_speed: data["wind"]["speed"],
          weather_condition: data["weather"].first["description"],
          timestamp: Time.at(data["dt"]) # 将Unix时间戳转换为Ruby时间对象
        }
      end
    end

    weather_data
  end
end
