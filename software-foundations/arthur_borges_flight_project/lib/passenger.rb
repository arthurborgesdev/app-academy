class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(number)
    @flight_numbers.include?(number.upcase)
  end

  def add_flight(flight_number)
    @flight_numbers << flight_number.upcase unless has_flight?(flight_number)
  end
end