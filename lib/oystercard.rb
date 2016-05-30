class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @lower_limit= MINIMUM_FARE
    @upper_limit= MAXIMUM_BALANCE
    @balance= 0
    @entry_station= nil
    @exit_station= nil
    @journeys= []
  end

  def top_up(value)
    fail "top up exceeds balance limit, cannot top up" if balance+value > upper_limit
    @balance += value
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Infsufficient balance" if balance < lower_limit
    @exit_station= nil
    @entry_station= station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station= station
    store_journey
    @entry_station= nil

  end

  private
  attr_reader :upper_limit, :lower_limit

  def deduct(value)
    @balance -= value
  end

  def store_journey
    journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end

end
