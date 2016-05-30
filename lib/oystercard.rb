class Oystercard
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
  end

  def top_up(amount)
    raise "Cannot top up because the maximum balance is #{MAXIMUM_BALANCE}" if maximum_balance_exceeded?(amount)
    @balance = (@balance + amount)
  end



  def touch_in(station)
    raise "Not enough balance" if !(minimum_balance?)
    @journey = true
    @entry_station = station
  end

  def in_journey?
    !(@entry_station.nil?)
  end

  def touch_out(fare)
    deduct(fare)
    @journey = false
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance = (@balance - fare)
  end

  def maximum_balance_exceeded?(amount)
    (@balance + amount) > MAXIMUM_BALANCE
  end

  def minimum_balance?
    @balance >= 1
  end
end
