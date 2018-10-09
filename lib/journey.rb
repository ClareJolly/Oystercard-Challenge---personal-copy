require_relative "station.rb"

class Journey

  attr_accessor :end_station
  attr_reader :start_station
  attr_reader :fare

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @start_station = station
    @end_station = nil
    @fare = 0
  end

  def end_journey(endstation)
    @end_station = endstation
    calculate_fare
  end

  def complete?
    (@start_station.nil? || @end_station.nil?) ? false : true
  end

  def calculate_fare
    !complete? ? @fare = PENALTY_FARE : @fare = MIN_FARE
  end
end

# class FareCalculator
#
#   def return_fare(z1,z2)
#     5
#   end
#
# end
