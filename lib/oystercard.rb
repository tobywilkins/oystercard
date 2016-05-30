class Oystercard
  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
    @journeys = {}
  end

  def top_up(amount)
    raise "Cannot top up because the maximum balance is #{MAXIMUM_BALANCE}" if maximum_balance_exceeded?(amount)
    @balance = (@balance + amount)
  end

 def journeys
  @journeys == {} ? nil : pretty_print_journeys
 end

  def touch_in(station)
    raise "Not enough balance" if !(minimum_balance?)
    @journey = true
    @entry_station = station
  end

  def in_journey?
    !(@entry_station.nil?)
  end

  def touch_out(fare,exit_station)
    deduct(fare)
    @journey = false
    @journeys[@entry_station] = exit_station
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

  def pretty_print_journeys
    output = ""
    @journeys.each do |entry,exit| output <<
    "#{entry} : #{exit}"
    end
    return output
  end
end
