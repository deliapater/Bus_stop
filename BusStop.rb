class BusStop
attr_accessor :name, :queue

def initialize(name)
@name = name
@queue = []
end

def passengers_in_queue()
  return @queue.count()
end

def add_person_to_queue(person)
@queue << person
end
end
