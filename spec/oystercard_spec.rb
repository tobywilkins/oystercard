require 'oystercard'
describe Oystercard do

  let(:station) { double :station }

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

    it 'raises an error if top_up exceeds balance limit' do
      expect { subject.top_up(100) }.to raise_error "top up exceeds balance limit, cannot top up"
      subject.top_up(50)
      expect { subject.top_up(50) }.to raise_error "top up exceeds balance limit, cannot top up"
    end
  end

  describe "#in_journey?" do
    it 'is defaultly not in in_journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'raises error if balance is less than minimum fair' do
      expect{subject.touch_in(station)}.to raise_error "Infsufficient balance"
    end
  end

context 'starts at max balance' do
  before(:each){subject.top_up(Oystercard::MAXIMUM_BALANCE)}

  describe '#touch_in' do
    it 'change in_journey to true' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'remembers entry station' do
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch_out' do
    it 'change in_journey to false' do
      subject.touch_in(station)
      expect(subject).to be_in_journey
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'sets entry station to nil' do
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end

    it 'reduces balance by MINIMUM_FARE' do
      subject.touch_in(station)
      expect{subject.touch_out}.to change{subject.balance}.by -Oystercard::MINIMUM_FARE
    end
  end
end

end
