class Oystercard

MAXIMUM_BALANCE = 90

attr_reader :balance

  def initialize
    @balance = 0
    @touched_in = false
    @touched_out = false
  end

  def top_up(amount)
  	fail "Maximum card balance exceeded. Maximum balance is: #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @touched_in = true
  end

  def touch_out
    @touched_in = false
    @touched_out = true
  end

  def in_journey?
    @touched_in && @touched_out == false ? true : false
  end
end
