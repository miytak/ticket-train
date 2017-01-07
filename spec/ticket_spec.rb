require 'ticket'
RSpec.describe Ticket do
  describe '.initialize' do
    context '150円の切符の場合' do
      let(:ticket) { Ticket.new(150) }

      it '切符インスタンスが出来る' do
        expect(ticket).to be_truthy
      end

      it '切符の金額が150円であることがわかる' do
        expect(ticket.price).to eq 150
      end
    end
  end
end
