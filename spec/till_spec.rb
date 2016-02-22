require 'till'

describe 'Till' do
  subject(:till) {Till.new}

  describe 'Accepts payment' do
    let(:order) { double :order, calculate_total: 20 }

    it 'Doesnt raise error if correct amount is paid' do
      expect(till.pay(20)).to eq("Payment Accepted")
    end
    it 'Raises an error if payment is not enough' do
      till.instance_variable_set(:@order, order)
      # allow(:order).to receive(:calculate_total).and_return(20)
      expect{till.pay(15)}.to raise_error("Insufficient Payment")
    end

    it 'Returns value of money owed after paying for items' do
      till.instance_variable_set(:@order, order)
      till.pay(35)
      expect(till.change).to eq(15)
    end
  end
end
