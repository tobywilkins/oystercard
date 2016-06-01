require_relative 'journey'

class JourneyLog #history of journeys made on an oyster card
attr_reader :journey_history
  def initialize
    @journey_history = []
    @journey = Journey.new
  end

  def log
    journey_history
  end

  def start(entry_station)

  end


  def add_journey_to_log (journey = Journey.new)
    journey_history << journey.stations
  end

end