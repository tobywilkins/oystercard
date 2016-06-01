require_relative "journey"

class Oystercard #an object with a balance that interacts with LU

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey_history = []
    @journey = Journey.new
    # @entry_station = entry_station
    # @exit_station = exit_station
    # @journey = Journey.new
  end

  def top_up(amount)
    fail "Maximum card balance exceeded. Maximum balance is: #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    balance_check
    journey.set_entry_station(entry_station)
    # @entry_station = entry_station
  end

  def touch_out(exit_station)
    journey.set_exit_station(exit_station)
    deduct(journey.fare)
    set_journey_history
    journey.clear_history
    journey_history
  end


  private

  attr_reader :journey, :journey_history

  def deduct(fare)
    @balance -= fare
  end

  def set_journey_history
    journey_history << journey.stations
  end

  def balance_check
    fail "There is not enough credit." if balance < MINIMUM_BALANCE
  end

end
