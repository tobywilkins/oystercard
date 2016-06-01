class Journey #tracks travelling data between a-b
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :entry_station, :journey

  def initialize
    @journey = []
  end

  def set_entry_station(entry_station)
    @entry_station = entry_station
  end

  def set_exit_station(exit_station)
    @exit_station = exit_station
  end


  def in_journey?
    !!entry_station
  end

  def stations
    {entry_station => exit_station}
  end

  def clear_history
    @entry_station = nil
    @exit_station = nil
  end

  def fare
    check_penalty ? PENALTY_FARE : MINIMUM_FARE
  end

  private

  attr_reader :entry_station, :exit_station

  def check_penalty
    (entry_station.nil? && !!exit_station) || (exit_station.nil? && !!entry_station)
  end

end
