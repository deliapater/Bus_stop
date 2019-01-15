require("minitest/autorun")
require("minitest/rg")
require_relative("../BusStop")
require_relative("../Person")

class TestBusStop < MiniTest::Test

def setup
@bus_stop = BusStop.new("Buchanan")
@person1 = Person.new("John", 35)
end

def test_bus_stop_has_name
assert_equal("Buchanan", @bus_stop.name)
end

def test_empty_queue
  assert_equal(0, @bus_stop.passengers_in_queue())
end

def test_add_person_to_queue
@bus_stop.add_person_to_queue(@person1)
assert_equal(1, @bus_stop.passengers_in_queue())
end
end
