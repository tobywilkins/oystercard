require 'oystercard'
describe Oystercard do
 let(:station) {double(:station)}
 let(:exit_station) {double(:exit_station)}
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
    it 'should raise error if maximum balance is reached' do
      expect{subject.top_up(100)}.to raise_error("Cannot top up because the maximum balance is #{Oystercard::MAXIMUM_BALANCE}")
    end
  end

  # describe '#deduct' do
  #   it {should respond_to(:deduct).with 1}
  #   it 'should deduct the amount from the balance' do
  #   subject.top_up(10)
  #   expect(subject.deduct(5)).to eq 5
  #   end
  # end

  describe '#touch_in' do
    it {should respond_to(:touch_in).with 1}
    it 'should raise error if balance is under minimum' do
      expect{subject.touch_in("xyz")}.to raise_error("Not enough balance")
    end
    # it "updates the station" do
    #   subject.top_up(10)
    #   subject.touch_in(station)
    #   expect(subject.entry_station).to eq(station)
    # end

  end

  describe '#in_journey?' do
    it {should respond_to(:in_journey?)}
    it 'should be true if touched in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
    it 'should be false if touched out' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(5,exit_station)
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_out' do
    it {should respond_to(:touch_out)}
    it 'should deduct the fare' do
      subject.top_up(10)
      expect{subject.touch_out(5,exit_station)}.to change{subject.balance}.from(10).to(5)
    end
    # it 'should wipe the entry station and set it to nil' do
    #   subject.top_up(10)
    #   subject.touch_in(station)
    #   subject.touch_out(5,exit_station)
    #   expect(subject.entry_station).to eq nil
    # end

    it 'should give out Entry Station : Exit station' do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(5,exit_station)
      expect(subject.journeys).to eq "#{station} : #{exit_station}"
    end

    it 'should return nil if no journeys' do
    expect(subject.journeys).to eq nil
    end
  end
end
