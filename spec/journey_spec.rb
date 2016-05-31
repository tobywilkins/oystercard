require 'journey'

describe Journey do
  subject {described_class.new(entry_station)}

  let(:entry_station) { double :station,name: "Waterloo", zone: 1 }
  let(:exit_station) {double :station,name: "Leyton", zone: 3 }

  context 'Sucessful journey' do

    describe '#finish' do
      it 'returns a hash containing entry, exit & fare' do
        expect(subject.finish(exit_station)).to eq({entry_station: entry_station,exit_station: exit_station,fare: 1})
      end
    end

    describe '#fare'do

      it 'returns the minimum fare' do
        subject.finish(exit_station)
        expect(subject.fare).to eq 1
      end
    end

    describe '#complete?'do
      it 'checks if journey has an entry & exit station' do
        subject.finish(exit_station)
        expect(subject.complete?).to eq true
      end
    end
  end

  context 'Unsuccessful Journey' do

    describe '#complete?' do
      it 'returns false as journey incomplete' do
      expect(subject.complete?).to eq false
      end
    end

    describe '#fare' do
      it 'returns penalty fare' do
        expect(subject.fare).to eq 6
      end
    end
  end

end