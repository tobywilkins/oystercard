require 'oystercard'

describe Oystercard do

  it "should start with a balance of zero." do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do

  	it "should increase the balance with a specified amount." do
  		expect{subject.top_up(10)}.to change{subject.balance}.by 10
  	end

  	it "should raise an error if balance reaches card capacity." do
  		subject.top_up(Oystercard::MAXIMUM_BALANCE)
  		expect{subject.top_up(1)}.to raise_error("Maximum card balance exceeded. Maximum balance is: #{Oystercard::MAXIMUM_BALANCE}")
  	end
  end

  describe "#deduct" do

    it "should decrease the balance with a specified fare." do
      subject.top_up(10)
      expect{subject.deduct(10)}.to change{subject.balance}.by -10
    end
  end

  describe "#touch_in" do

    it "should return true if user touched in" do
      subject.top_up(5)
      expect(subject.touch_in).to eq true
    end

  end

  describe "#touch_out" do

    it "should return true if user touched out." do
      subject.top_up(5)
      expect(subject.touch_out).to eq true
    end
  end

  describe "#in_journey?" do

    it "should let oystercard know it is in a journey." do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it "should not be in a journey if touched in and touched out." do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end


end
