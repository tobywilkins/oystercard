require_relative 'oystercard'

class JourneyLog #history of journeys made on an oyster card
attr_reader :journey_history

  def initialize
    @journey_history = []
    @current_journey = []
  end

  def log
    journey_history
  end

  def start(entry_station)
   if !!journey
    no_touch_out
    #need to instantiate a new journey with the new entry station
    return journey.fare
  else
    instantiate_journey(entry_station)
    0
  end
end

  def finish(exit_station)
    !!journey ? complete_journey(exit_station) : no_touch_in(exit_station)
    journey_history << current_journey
    current_journey = []
    journey.fare
  end

  private

  attr_reader :journey, :current_journey

  def no_touch_out
    current_journey << nil
    journey_history << current_journey
  end


  def no_touch_in(exit_station)
    @journey = Journey.new
    journey.set_exit_station(exit_station)
    current_journey << nil
    current_journey << exit_station
  end

  def complete_journey(exit_station)
    journey.set_exit_station(exit_station)
    current_journey << exit_station
  end

  def instantiate_journey(entry_station)
    @journey = Journey.new
    journey.set_entry_station(entry_station)
    current_journey << entry_station
    0
  end

end
