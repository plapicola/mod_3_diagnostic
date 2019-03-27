class Facility
  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_times

  def initialize(facility_info)
    @name = facility_info[:station_name]
    @address = facility_info[:street_address]
    @fuel_types = facility_info[:fuel_type_code]
    @distance = facility_info[:distance].to_f
    @access_times = facility_info[:access_days_time]
  end
end
