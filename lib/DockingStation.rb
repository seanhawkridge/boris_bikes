require "./lib/Bike.rb"

class DockingStation

  attr_reader :bike

  def initialize
    @first_bike = true
  end

  def release_bike
    if @first_bike
      #bike = Bike.new
      @first_bike = false
      Bike.new
    elsif self.dock(bike) != nil
      #bike = Bike.new
      Bike.new
    else
        raise "No bike to release, use you eyes!"
    end
  end

  def dock(bike)
    @bike = bike
  end

end
