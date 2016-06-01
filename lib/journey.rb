class Journey #tracks travelling data between a-b
  attr_reader :entry_station

  def initialize
    @journey = []
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
  end

  def set_exit_station(exit_station)
    @exit_station = exit_station
  end

  def journey_history(stations)
    journey << stations
    clear_history
    journey
  end


  def in_journey?
    !!entry_station
  end

  private

  attr_reader :journey, :entry_station, :exit_station

  def clear_history
    @entry_station = nil
    @exit_station = nil
  end

    def stations
    {entry_station => exit_station}
  end

end
