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
  oystercard.touch_in
  oystercard.touch_out(2)



  end
end
