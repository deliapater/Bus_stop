require("minitest/autorun")
require("minitest/rg")
require_relative("../Person")

class TestPerson < MiniTest::Test

def setup
@person = Person.new("John", 35)
end

def test_person_has_name
assert_equal("John", @person.name)
end

def test_person_has_age
assert_equal(35, @person.age)
end



end
