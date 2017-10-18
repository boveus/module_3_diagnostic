class FuelStation
  def initialize(params)
    @name = nil
    @address = nil
    @fuel_types = nil
    @distance = nil
    @access_times = nil
    @lat = nil
    @long = nil
    setup_from_params(params)
  end

  def setup_from_params(params)
    @fuel_types = params["fuel_type_code"]
    @address = params["street_address"]
    @name = params["station_name"]
    @access_time = params["access_days_time"]
    @lat = params["latitude"]
    @lat = params["longitude"]
  end
end
