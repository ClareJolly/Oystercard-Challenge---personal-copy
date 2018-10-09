require './lib/card.rb'
# require './lib/station.rb'
require './lib/journey.rb'
# require './lib/weather.rb'
card = Card.new(50)
station = Station.new("Camden")
card.touch_in(station)
