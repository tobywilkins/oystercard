require 'oystercard'
describe Oystercard do

  describe '::initialize' do
    it 'should have ab balance of 0' do
      expect(subject.balance).to eq (0)
    end
  end

  describe '#top_up' do
    it {should respond_to(:top_up).with 1}
    it 'should add amount to the balance' do
    expect(subject.top_up(10)).to eq 10
    end
  end
end
