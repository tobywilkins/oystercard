require 'oystercard'

describe 'feature test' do
  it 'works' do
  oystercard = Oystercard.new
  # oystercard.top_up(10)
  # oystercard.deduct(5)
  # oystercard.touch_in
  # # print oystercard.in_journey?
  # oystercard.touch_out
  # print oystercard.in_journey?
  oystercard.top_up(10)
  print oystercard.touch_in


  end
end
