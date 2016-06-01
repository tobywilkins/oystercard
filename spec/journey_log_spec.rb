require 'journey_log'

describe JourneyLog do
  subject {described_class.new}
  let(:journey) {double :journey, :stations => {"Bank" => "Angel"}}
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}


  describe '#start' do
    it {should respond_to(:start).with 1}
    it "initiates a new journey" do
      subject.start(entry_station)
      expect(subject.log).to eq []
    end
  end

  describe '#finish' do
    it {should respond_to(:finish).with 1}
    it "it completes a successful journey" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.log).to eq [[entry_station, exit_station]]
    end

    it "completes a new journey if only touch out" do
      subject.finish(exit_station)
      expect(subject.log).to eq [[nil, exit_station]]
    end

  end

end
