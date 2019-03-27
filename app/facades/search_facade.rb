class SearchFacade
  def initialize(zipcode)
    @zipcode = zipcode
    @nrel_service = NRELService.new
  end

  def stations
    found_stations = @nrel_service.nearest_stations(@zipcode)[:fuel_stations]
    found_stations.map do |station_info|
      Facility.new(station_info)
    end
  end

  def station_count
    @nrel_service.nearest_stations(@zipcode)[:total_results]
  end
end
