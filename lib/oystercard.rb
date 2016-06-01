require_relative "journey"

class Oystercard #an object with a balance that interacts with LU

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  attr_reader :balance

  def initialize
    @balance = 0
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
    @journey = Journey.new
    journey.set_entry_station(entry_station)
    # @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    journey.set_exit_station(exit_station)
  end

  private

  attr_reader :journey

  def deduct(fare)
    @balance -= fare
  end


  def balance_check
    fail "There is not enough credit." if balance < MINIMUM_BALANCE
  end

end
