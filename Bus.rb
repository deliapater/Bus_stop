require("pry")

class Bus
  attr_accessor :route_number, :destination

  def initialize(route_number, destination)
    @route_number = route_number
    @destination = destination
    @passengers = []
  end

  def drive()
    return "Brum brum"
  end

  def count_passengers()
    return @passengers.count()
  end

  def add_passenger(person)
    @passengers << person
  end

  def drop_off(person)
    @passengers.delete(person)
  end

  def empty()
    @passengers = []
  end

  def pick_up_from_stop(stop)
    # everybody in the stop queue moves to the bus
    @passengers += stop.queue

    # remove everyone from the bus stop queue
    stop.queue = []

  end

end
