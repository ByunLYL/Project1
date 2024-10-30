# app/services/world_cities_service.rb
require 'httparty'

class WorldCitiesService
  include HTTParty
  base_uri 'http://geodb-free-service.wirefreethought.com/v1/geo'

  def search_cities(query)
    response = self.class.get("/cities", query: { namePrefix: query })
    response.parsed_response if response.success?
  end
end
