require 'ticket'
require 'station'
require 'gate'

RSpec.describe Gate do
  context '1:150円の切符で梅田で入場、十三で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    jyuso_station = Station.new(:jyuso)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(jyuso_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '2:150円の切符で梅田で入場、庄内で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    shounai_station = Station.new(:shounai)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(shounai_station)

    it '出場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      expect{leaving_gate.leave!(passed_ticket)}.to raise_error Exception
    end
  end

  context '3:180円の切符で梅田で入場、庄内で出場する' do
    ticket = Ticket.new(180)
    umeda_station = Station.new(:umeda)
    shounai_station = Station.new(:shounai)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(shounai_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '4:220円の切符で梅田で入場、庄内で出場する' do
    ticket = Ticket.new(220)
    umeda_station = Station.new(:umeda)
    shounai_station = Station.new(:shounai)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(shounai_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '5:180円の切符で梅田で入場、岡町で出場する' do
    ticket = Ticket.new(180)
    umeda_station = Station.new(:umeda)
    okamachi_station = Station.new(:okamachi)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(okamachi_station)

    it '出場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      expect{leaving_gate.leave!(passed_ticket)}.to raise_error Exception
    end
  end

  context '6:220円の切符で梅田で入場、岡町で出場する' do
    ticket = Ticket.new(220)
    umeda_station = Station.new(:umeda)
    okamachi_station = Station.new(:okamachi)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(okamachi_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '7:150円の切符で十三で入場、岡町で出場する' do
    ticket = Ticket.new(150)
    jyuso_station = Station.new(:jyuso)
    okamachi_station = Station.new(:okamachi)
    entering_gate = Gate.new(jyuso_station)
    leaving_gate = Gate.new(okamachi_station)

    it '出場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      expect{leaving_gate.leave!(passed_ticket)}.to raise_error Exception
    end
  end

  context '8:180円の切符で十三で入場、岡町で出場する' do
    ticket = Ticket.new(180)
    jyuso_station = Station.new(:jyuso)
    okamachi_station = Station.new(:okamachi)
    entering_gate = Gate.new(jyuso_station)
    leaving_gate = Gate.new(okamachi_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '9:150円の切符で十三で入場、梅田で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    jyuso_station = Station.new(:jyuso)
    entering_gate = Gate.new(jyuso_station)
    leaving_gate = Gate.new(umeda_station)

    it '出場できる' do
      passed_ticket = entering_gate.enter!(ticket)
      expect(leaving_gate.leave!(passed_ticket)).to be_truthy
    end
  end

  context '10:150円の切符で梅田で入場、梅田で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(umeda_station)

    it '出場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      expect{leaving_gate.leave!(passed_ticket)}.to raise_error Exception, '入場駅ではない駅で出場してください'
    end
  end

  context '11:150円の切符で梅田で入場、梅田で入場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    entering_gate = Gate.new(umeda_station)

    it '入場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      expect{entering_gate.enter!(passed_ticket)}.to raise_error Exception, '入場済みの切符では入場できません'
    end
  end

  context '12:150円の切符で梅田で入場、十三で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    jyuso_station = Station.new(:jyuso)
    entering_gate = Gate.new(umeda_station)
    leaving_gate = Gate.new(jyuso_station)

    it '出場できない' do
      passed_ticket = entering_gate.enter!(ticket)
      invalid_ticket = leaving_gate.leave!(passed_ticket)
      expect{leaving_gate.leave!(invalid_ticket)}.to raise_error Exception, '使用済みの切符で出場できません'
    end
  end

  context '13:150円の切符で梅田で入場、十三で出場する' do
    ticket = Ticket.new(150)
    umeda_station = Station.new(:umeda)
    leaving_gate = Gate.new(umeda_station)

    it '出場できない' do
      expect{leaving_gate.leave!(ticket)}.to raise_error Exception, '入場していない切符では出場できません'
    end
  end

end
