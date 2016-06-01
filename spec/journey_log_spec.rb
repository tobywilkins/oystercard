require 'journey_log'

describe JourneyLog do
  subject {described_class.new}
  let(:journey) {double :journey, :stations => {"Bank" => "Angel"}}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe '#log' do
    it 'should display previous journeys' do
      subject.add_journey_to_log(journey)
      expect(subject.log).to eq [{"Bank" => "Angel"}]
    end
  end

  describe '#start' do
    it {should respond_to(:start).with 1}
  end

  describe '#finish' do
  end

end