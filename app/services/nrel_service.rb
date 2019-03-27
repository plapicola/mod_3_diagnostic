class NRELService
  def nearest_stations(zipcode)
    url = "/api/alt-fuel-stations/v1/nearest.json?location=80208&radius=5&status=E&access=public&fuel_type=ELEC,LPG&api_key=#{ENV['NREL_API_KEY']}"
    @nearest_stations ||= get_json(url)
  end

  private

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
