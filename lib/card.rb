class Card
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journeys = []
  end

  def top_up(money)
    raise "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def touch_in(station)
    raise "You need a minimum balance of £#{MINIMUM_FARE} to enter barrier." if balance_low
    @entry_station = station
    @journeys << Hash.new(:start => station, :destination => nil)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    raise "No record" if @journeys.last.nil?
    @journeys.last[:destination] = station
  end

  def in_journey?
    !!entry_station
  end

  def journey_list
    @journeys
  end

  private

  def exceeds_limit?(money)
    (@balance + money) > LIMIT
  end

  def balance_low
    balance <= MINIMUM_FARE
  end

  def deduct(fare)
    @balance -= fare
  end
end
