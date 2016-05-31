require 'oystercard'

describe Oystercard do

  before(:each) do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  let(:entry_station) {double :entry_station}

  describe "#top_up" do

  	it "should raise an error if balance reaches card capacity." do
  		expect{subject.top_up(1)}.to raise_error("Maximum card balance exceeded. Maximum balance is: #{Oystercard::MAXIMUM_BALANCE}")
  	end
  end

  describe "#touch_in" do

    it "should return true if user touched in" do
      expect(subject.touch_in(entry_station)).to eq entry_station
    end

  end

  describe "#touch_out" do

    before(:each) do
      subject.touch_in(entry_station)
    end

    it "should deduct a fare on touch_out" do
      expect{subject.touch_out}.to change{subject.balance}.by -(Oystercard::MINIMUM_FARE)
    end

    it "should forget the entry station on touch out" do
      subject.touch_out
      expect(subject.entry_station).to be nil
    end
  end

  describe "#in_journey?" do

    before(:each) do
      subject.touch_in(entry_station)
    end

    it "should let oystercard know it is in a journey." do
      p subject.in_journey?
      expect(subject.in_journey?).to eq true
    end

    it "should not be in a journey if touched in and touched out." do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end


end
