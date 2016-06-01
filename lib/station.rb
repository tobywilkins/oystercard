class Station #physical place with data


  attr_reader :station_name, :zone_number

  def initialize(name: station_name, zone: zone_number)
    @station_name = name
    @zone_number = zone
  end

end
