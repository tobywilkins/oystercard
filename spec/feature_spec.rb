require 'oystercard'

  describe 'feature test' do
    it 'works' do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      oystercard.touch_in("Bank")
      oystercard.touch_out("Oxford Circus")
      oystercard.journey_history
    end
  end