require_relative "station.rb"
require_relative "journey.rb"

class Card
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

  LIMIT = 90
  # MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
    # p Journey::MIN_FARE
  end

  def top_up(money)
    raise "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def touch_in(station)
    # p station
    journey = Journey.new(station)
    raise "You need a minimum balance of £#{Journey::MIN_FARE} to enter barrier." if balance_low
    @journeys << journey
  end

  def touch_out(station)
    # deduct(MINIMUM_FARE)
    # raise "No record" if @journeys.last.nil?
    # @journeys.last.end_station=(station)
    @journeys.last.end_journey(station)
    deduct(@journeys.last.fare)
  end

  # def ongoing_journey?
  #   (@journeys.last[:start] != nil) && (@journeys.last[:destination] == nil)
  # end

  def journey_list
    @journeys
  end

  private

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
