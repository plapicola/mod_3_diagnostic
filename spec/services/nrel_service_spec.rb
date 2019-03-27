require 'rails_helper'

describe NRELService do
  it 'exists' do
    service = NRELService.new

    expect(service).to be_a(NRELService)
  end

  describe '.nearest_stations' do
    it 'returns a list of all public electric and propane stations within limit miles' do
      service = NRELService.new

      VCR.use_cassette("services/nrel_service") do
        facilities = service.nearest_stations("80208")

        expect(facilities).to be_a(Hash)
        expect(facilities).to have_key(:total_results)
        expect(facilities).to have_key(:fuel_stations)
        expect(facilities[:fuel_stations]).to be_a Array
        expect(facilities[:fuel_stations][0]).to be_a Hash
        expect(facilities[:fuel_stations][0]).to have_key :station_name
        expect(facilities[:fuel_stations][0]).to have_key :street_address
        expect(facilities[:fuel_stations][0]).to have_key :fuel_type_code
        expect(facilities[:fuel_stations][0]).to have_key :distance
        expect(facilities[:fuel_stations][0]).to have_key :access_days_time
      end
    end
  end
end
