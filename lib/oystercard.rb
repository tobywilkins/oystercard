class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance

  def initialize
    @lower_limit= MINIMUM_BALANCE
    @upper_limit= MAXIMUM_BALANCE
    @balance= 0
    @in_journey= false
  end

  def top_up(value)
    fail "top up exceeds balance limit, cannot top up" if balance+value > upper_limit
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Infsufficient balance" if balance < lower_limit
    @in_journey= true
  end

  def touch_out
    @in_journey= false
  end

  private
  attr_reader :upper_limit, :lower_limit
end
