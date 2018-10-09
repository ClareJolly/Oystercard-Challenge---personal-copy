class Journey

  def initialize(start_station)
    @startstation = start_station.get_name
    @endstation = nil
    @startstationzone = start_station.get_zone
    @endstationzone = nil
    @fare = 0
  end

  def show_start
    @startstation
  end

  def end_journey(endstation)
    @endstation = endstation.get_name
    @endstationzone = endstation.get_zone
  end

  def show_end
    @endstation
  end

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
