require_relative "station.rb"

class Journey

  attr_accessor :end_station
  attr_reader :start_station
  attr_reader :fare

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(station)
    @start_station = station
    # @startstation = @start_station.name
    @end_station = nil
    # @startstationzone = @start_station.zone
    # @endstationzone = nil
    @fare = 0
  end

  # def show_start
  #   @startstation
  # end

  def end_journey(endstation)
    @end_station = endstation
    calculate_fare
    # @endstationzone = endstation.zone
  end

  # def show_end
  #   @endstation
  # end

  def complete?
    (@start_station.nil? || @end_station.nil?) ? false : true
  end

  def calculate_fare
    # raise "not completed" unless complete?
    # MIN_FARE
    !complete? ? @fare = PENALTY_FARE : @fare = MIN_FARE
    # p @fare
    # raise "Not complete" unless complete?
    # @fare = FareCalculator.new.return_fare(@startstationzone,@endstationzone)
  end
end

# class FareCalculator
#
#   def return_fare(z1,z2)
#     5
#   end
#
# end
