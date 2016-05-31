require 'station'

describe Station do
subject(:station) {described_class.new("Waterloo", 1)}

  describe '::new' do

    it 'should have a name' do
      expect(station.name).to eq "Waterloo"
    end

    it 'should have a zone' do
      expect(station.zone).to eq 1
    end
  end
end