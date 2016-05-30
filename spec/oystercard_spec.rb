require 'oystercard'
describe Oystercard do
  describe '::initialize' do
    it 'should have ab balance of 0' do
      expect(subject.balance).to eq (0)
    end
  end
end
