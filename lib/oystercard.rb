class Oystercard
  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot top up because the maximum balance is #{MAXIMUM_BALANCE}" if maximum_balance_exceeded?(amount)
    @balance = (@balance + amount)
  end

  private
  def maximum_balance_exceeded?(amount)
    (@balance + amount) > MAXIMUM_BALANCE
  end
end
