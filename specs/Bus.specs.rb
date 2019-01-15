require("minitest/autorun")
require("minitest/rg")
require_relative("../Bus")
require_relative("../Person")
require_relative("../BusStop")

class TestBus < MiniTest::Test

def setup
@person1 = Person.new("John", 35)
@person2 = Person.new("Colin", 30)
@bus = Bus.new(22, "Ocean Terminal")
@stop1 = BusStop.new("Buchanan")
end

def test_bus_has_route_number
assert_equal(22, @bus.route_number)
end

def test_bus_has_destination
assert_equal("Ocean Terminal", @bus.destination)
end

def test_bus_can_drive
assert_equal("Brum brum", @bus.drive())
end

def test_bus_starts_without_passengers
assert_equal(0, @bus.count_passengers())
end

def test_add_passenger
@bus.add_passenger(@person1)
assert_equal(1, @bus.count_passengers())
end

def test_drop_off_passenger
@bus.add_passenger(@person1)
@bus.add_passenger(@person2)
@bus.drop_off(@person1)
assert_equal(1, @bus.count_passengers())
end

def test_empty_bus
  @bus.add_passenger(@person1)
  @bus.empty()
  assert_equal(0, @bus.count_passengers())
end

def test_pick_up_from_stop
  @stop1.add_person_to_queue(@person1)
  @stop1.add_person_to_queue(@person2)

  @bus.pick_up_from_stop(@stop1)
  # test that everybodyin the queue is now in the bus
  assert_equal(2, @bus.count_passengers())

  # test that there's nobody left in the queue
  assert_equal(0, @stop1.passengers_in_queue())
end

end
