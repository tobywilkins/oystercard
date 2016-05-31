require 'station'

describe Station do

  let(:station) {described_class.new(station_name)}
  let(:station_name) {double :station_name}

  it "should accept a station name" do
    expect(station.station_name).to eq station_name
  end


    describe "#check_zone" do

      it "returns the zone of a station" do
        expect(station.check_zone).to eq 1
      end

    end






end
