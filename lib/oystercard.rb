class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize
    @limit= MAXIMUM_BALANCE
    @balance= 0
    @in_journey= false
  end

  def top_up(value)
    fail "top up exceeds balance limit, cannot top up" if balance+value > limit
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey= true
  end

  def touch_out
    @in_journey= false
  end

  private
  attr_reader :limit
end
