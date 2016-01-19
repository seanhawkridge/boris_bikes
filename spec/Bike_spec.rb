require "Bike.rb"

describe Bike do

  subject(:bike) {described_class.new}

  it "returns working == true if bike is working" do
    expect(bike.working?).to eq true
  end

end
