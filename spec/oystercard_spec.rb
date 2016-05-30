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

    it 'raises an error if top_up exceeds balance limit' do
      expect { subject.top_up(100) }.to raise_error "top up exceeds balance limit, cannot top up"
      subject.top_up(50)
      expect { subject.top_up(50) }.to raise_error "top up exceeds balance limit, cannot top up"
    end
  end

  describe '#deduct' do
    it{is_expected.to respond_to(:deduct).with(1).argument}

    it "can deduct from the balance" do
      subject.top_up(10)
      expect{ subject.deduct 1}.to change{subject.balance}.by -1
    end
  end
end
