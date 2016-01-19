require "DockingStation.rb"

describe DockingStation do

  subject(:dockingstation) {described_class.new}

  it "returns release_bike == true when asked to release bike" do
     expect(dockingstation).to respond_to (:release_bike)
  end

  it "initializes new bike when release_bike == true" do
    expect((subject.release_bike).working?).to be_truthy
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it "docks bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "returns the same bike as was docked once docked" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end
