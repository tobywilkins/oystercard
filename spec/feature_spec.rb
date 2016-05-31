require 'oystercard'
require 'station'

describe 'feature test' do
  it 'works' do
  oyster = Oystercard.new
  oyster.top_up(50)
  waterloo = Station.new("Waterloo",1)
  oyster.touch_in(waterloo)
  end
end