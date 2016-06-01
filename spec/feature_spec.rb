require 'oystercard'

describe 'feature test' do
  it 'works' do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in("Bank")
    p oystercard.touch_out("Oxford Circus")
    p oystercard.balance
    p oystercard.touch_out("Angel")
  end

  it "should apply penalty fair if no touch in" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    p oystercard.touch_out("Oxford Circus")
    p oystercard.balance
  end
end
