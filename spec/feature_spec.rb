require 'oystercard'

describe 'feature test' do
  it 'works' do
  oystercard = Oystercard.new
  oystercard.top_up(10)
  print oystercard.balance
  end
end