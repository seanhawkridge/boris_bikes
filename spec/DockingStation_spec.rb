require "DockingStation.rb"
require "Bike.rb"

describe DockingStation do

  subject(:dockingstation) {described_class.new}

  it "returns release_bike == true when asked to release bike" do
     expect(dockingstation).to respond_to (:release_bike)
  end

  it "initializes new bike when release_bike == true" do
    expect((subject.release_bike).working?).to be_truthy
  end


end
