require 'rails_helper'

describe Facility do
  it 'exists' do
    facility = Facility.new({})

    expect(facility).to be_a(Facility)
  end

  it 'has_attributes' do
    facility = Facility.new(station_name: "Test Name",
                            street_address: "123 Somewhere",
                            fuel_type_code: "ELEC",
                            distance: "4.097",
                            access_days_time: "24/7 365")

    expect(facility.name).to eq("Test Name")
    expect(facility.address).to eq("123 Somewhere")
    expect(facility.fuel_types).to eq("ELEC")
    expect(facility.distance).to eq(4.097)
    expect(facility.access_times).to eq("24/7 365")
  end
end
