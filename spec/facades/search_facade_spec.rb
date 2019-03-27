require 'rails_helper'

describe SearchFacade do
  it 'exists' do
    facade = SearchFacade.new("80208")

    expect(facade).to be_a(SearchFacade)
  end

  describe '.stations' do
    it 'returns of up to 15 stations within 5 miles of the provided zipcode sorted by distance' do
      facade = SearchFacade.new("80208")

      VCR.use_cassette("facades/search_facade") do
        expect(facade.stations.count).to be <= (15)
        expect(facade.stations.first).to be_a(Facility)
        facade.facilities.each_cons(2) do |facility_1, facility_2|
          expect(facility_1.distance).to be <= (facility_2.distance)
        end
        expect(facade.facilities.last.distance).to be <= (5.0)
      end
    end
  end

  describe '.station_count' do
    it 'returns the total number of public electric and propane stations within 5 miles' do
      VCR.use_cassette("facades/search_facade") do
        facade = SearchFacade.new("80208")

        expect(facade.station_count).to eq(86)
      end
    end
  end
end
