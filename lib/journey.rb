require_relative 'station'
require_relative 'journey_log'

class Journey #tracks current travel data between a-b for an oyster card
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

  def fare
    check_penalty ? PENALTY_FARE : MINIMUM_FARE
  end

  private

  attr_reader :entry_station, :exit_station

  def check_penalty
    (entry_station.nil? && !!exit_station) || (exit_station.nil? && !!entry_station)
  end

end
