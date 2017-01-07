class Station
  attr_reader :name, :number
  STATION_NUMBERS = { umeda: 1, jyuso: 2, shounai: 3, okamachi: 4 }.freeze

  def initialize name
    @name = name
    @number = STATION_NUMBERS[name]
  end
end
