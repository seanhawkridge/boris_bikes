require "DockingStation.rb"
require "Bike.rb"

describe DockingStation do

  subject(:dockingstation) {described_class.new}

  # it "returns a new object when method .new called on it" do
  #   expect(DockingStation.new).to eq true
  # end

  it "returns release_bike == true when asked to release bike" do
     expect(dockingstation).to respond_to (:release_bike)
  end

  it "initializes new bike when release_bike == true" do
    expect(dockingstation.release_bike).to be_instance_of Bike
  end

  it "returns release_bike == true when asked to release bike" do
     expect(Bike).to respond_to (:working?)
  end

  # describe ".working?" do
  #   it "returns true if bike is working" do
  #     Bike.working?.should == true
  #   end
  # end

end
