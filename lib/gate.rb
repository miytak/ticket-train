class Gate
  attr_reader :station

  def initialize station
    @station = station
  end

  def enter! ticket
    raise Exception.new('入場済みの切符では入場できません') if ticket.passed_at
    ticket.tap do |t|
      t.passed_at = Time.now
      t.entering_station = station
    end
  end

  def leave! ticket
    raise Exception.new('使用済みの切符で出場できません') if ticket.invalid
    raise Exception.new('入場していない切符では出場できません') unless ticket.passed_at
    raise Exception.new('入場駅ではない駅で出場してください') if station.number == ticket.entering_station.number

    step = (station.number - ticket.entering_station.number).abs
    if ticket.advancing_step >= step
      ticket.invalid = true
      ticket
    else
      raise Exception
    end
  end
end
