class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  
  def initialize
    @limit= MAXIMUM_BALANCE
    @balance= 0
  end

  def top_up(value)
    fail "top up exceeds balance limit, cannot top up" if balance+value > limit
    @balance += value
  end

  private
  attr_reader :limit
end
