require 'station'

describe Station do

  subject {described_class.new(name: "Bank", zone: 1)}

  it "knows its station name" do
    expect(subject.station_name).to eq "Bank"
  end


    describe "#check_zone" do

      it "returns the zone of a station" do
        expect(subject.zone_number).to eq 1
      end

    end






end
