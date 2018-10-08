class Card

  attr_reader :balance
  attr_accessor :journey

  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @journey = false
  end

  def top_up(money)
    fail "Top up would take balance over card limit - £#{LIMIT}" if exceeds_limit?(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    self.journey=(true)
  end

  def touch_out
    self.journey=(false)
  end

  def in_journey?
    journey
  end

  private

  def exceeds_limit?(money)
    (@balance + money) > LIMIT
  end

end
