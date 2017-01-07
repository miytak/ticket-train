class Ticket
  attr_reader :price, :advancing_step
  attr_accessor :passed_at, :entering_station, :invalid

  ADVANCING_STEPS = { 150 => 1, 180 => 2, 220 => 3 }

  def initialize price
    @price = price
    @advancing_step = ADVANCING_STEPS[price]
  end
end
