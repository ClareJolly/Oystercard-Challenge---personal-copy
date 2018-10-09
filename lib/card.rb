require_relative "station.rb"
require_relative "journey.rb"

class Card
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(money)
    raise "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def touch_in(station)
    journey = Journey.new(station)
    raise "You need a minimum balance of £#{Journey::MIN_FARE} to enter barrier." if balance_low
    @journeys << journey
  end

  def touch_out(station)
    @journeys.last.end_journey(station)
    deduct(@journeys.last.fare)
  end

  private

  # def journey_list
  #   @journeys
  # end

  def exceeds_limit?(money)
    (@balance + money) > LIMIT
  end

  def balance_low
    balance <= Journey::MIN_FARE
  end

  def deduct(fare)
    @balance -= fare
  end
end
