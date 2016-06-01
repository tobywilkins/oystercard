require 'oystercard'

describe Oystercard do

  subject {described_class.new}

  before(:each) do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
  end

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  describe "#top_up" do

  	it "should raise an error if balance reaches card capacity." do
  		expect{subject.top_up(1)}.to raise_error("Maximum card balance exceeded. Maximum balance is: #{Oystercard::MAXIMUM_BALANCE}")
  	end
  end

  describe "#touch_in" do

    it "should return station if user touched in" do
      expect(subject.touch_in(entry_station)).to eq entry_station
    end

    it 'should raise an error if balance is under minimum' do
       expect{Oystercard.new.touch_in(entry_station)}.to raise_error "There is not enough credit."
    end

  end

  describe "#touch_out" do

    before(:each) do
      subject.touch_in(entry_station)
    end

    it "should deduct a fare on touch_out" do
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by -(Oystercard::MINIMUM_FARE)
    end

  end

end
