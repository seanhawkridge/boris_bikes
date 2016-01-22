require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  describe '#initialize' do
    it { is_expected.to respond_to :bikes }

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'checks if capacity can be set' do
      expect(DockingStation.new(3).capacity).to eq 3
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      allow(bike).to receive(:working).and_return(true)

      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'raises an error if there are no bikes' do
      expect{subject.release_bike}.to raise_error("No bikes")
    end

    it 'will not release a broken bike' do
      allow(bike).to receive(:working).and_return(false)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("Bike is broken")
    end

    it 'will release a working bike and not a broken bike' do
      bike_two = double(:bike, :working => false)
      allow(bike).to receive(:working).and_return(true)

      subject.dock(bike_two)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'checks if the bike has been docked' do
      expect(subject.dock(bike)).to include bike
    end

    it 'raises an error if at capacity' do
      subject.capacity.times { subject.dock double(:bike) }
      expect{subject.dock(bike)}.to raise_error("Dock full")
    end

    it 'docks broken bikes' do
      allow(bike).to receive(:working).and_return(false)

      expect(subject.dock(bike)).to include bike
    end

  end

end
