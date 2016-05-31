require 'oystercard'
describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) {double :station}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station}}

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

  describe '#touch_in' do
    it 'raises error if balance is less than minimum fair' do
      expect{subject.touch_in(entry_station)}.to raise_error "Insufficient balance"
    end
  end

context 'Max balance' do
  before(:each){subject.top_up(Oystercard::MAXIMUM_BALANCE)}

  describe '#touch_out' do
    it 'reduces balance by MINIMUM_FARE' do
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -Oystercard::MINIMUM_FARE
    end
  end

  describe '#journeys' do
    it 'has an empty list of journeys by default' do
      expect(subject.journeys).to be_empty
    end
  end
end

end
