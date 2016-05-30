require 'oystercard'
describe Oystercard do

  describe '#balance' do
    it 'has a balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it{is_expected.to respond_to(:top_up).with(1).argument}
    it "increases balanced by expected value" do
      subject.top_up(5)
      expect(subject.balance).to eq 5
      subject.top_up(5)
      expect(subject.balance).to eq 10
    end
    it 'can top up the balance' do
      expect{subject.top_up 1}.to change{subject.balance}.by 1
    end
  end
end
