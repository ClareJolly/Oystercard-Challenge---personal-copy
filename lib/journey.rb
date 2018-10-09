class Journey

attr_reader :endstation
attr_reader :startstation

  def initialize(start_station)
    @startstation = start_station.name
    @endstation = nil
    @startstationzone = start_station.zone
    @endstationzone = nil
    @fare = 0
  end

  # def show_start
  #   @startstation
  # end

  def end_journey(endstation)
    @endstation = endstation.name
    @endstationzone = endstation.zone
  end

  # def show_end
  #   @endstation
  # end

  def complete?
    (@startstation.nil? || @endstation.nil? )? false : true
  end

  def calculate_fare
    raise "Not complete" unless complete?
    @fare = FareCalculator.new.return_fare(@startstationzone,@endstationzone)
  end
end

class FareCalculator

  def return_fare(z1,z2)
    5
  end

end
