class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 2

attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = entry_station
  end

  def top_up(amount)
  	fail "Maximum card balance exceeded. Maximum balance is: #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

  def touch_in(entry_station)
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_reader :journey

  def deduct(fare)
    fail "There is not enough credit." if balance - fare < MINIMUM_BALANCE
    @balance -= fare
  end


end
