class Oystercard
  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Cannot top up because the maximum balance is #{MAXIMUM_BALANCE}" if maximum_balance_exceeded?(amount)
    @balance = (@balance + amount)
  end

  def deduct(deducted_amount)
    @balance = (@balance - deducted_amount)
  end

  def touch_in
    raise "Not enough balance" if !(minimum_balance?)
    @journey = true
  end

  def in_journey?
    @journey
  end

  def touch_out
    @journey = false
  end

  private

  def maximum_balance_exceeded?(amount)
    (@balance + amount) > MAXIMUM_BALANCE
  end

  def minimum_balance?
    @balance >= 1
  end
end
