require_relative 'oystercard'

class JourneyLog #history of journeys made on an oyster card
attr_reader :journey_history

  def initialize
    @journey_history = []
  end

  def log
    journey_history
  end

  def start(entry_station)
    @journey = Journey.new
    journey.set_entry_station(entry_station)
    @journey_history << entry_station
  end

  def finish(exit_station)
    if !!journey
      journey.set_exit_station(exit_station)
      @journey_history << exit_station
    else
      @journey = Journey.new
      journey.set_exit_station(exit_station)
      @journey_history << nil
      @journey_history << exit_station
    end
  end

  def add_journey_to_log (journey = Journey.new)
    journey_history << journey.stations
  end

  private

  attr_reader :journey

end
