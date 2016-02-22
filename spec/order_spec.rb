require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  it 'Returns items with the price' do
    expect(order.menu).to include("Americano" => 3.75)
  end

  it 'Starts with an empty order' do
    expect(order.current_order).to eq([])
  end

  describe 'Placing an order' do
    it 'Adds item to current order' do
      order.place_order("Cafe Latte", 2)
      expect(order.current_order).to eq([["Cafe Latte", [2, 4.75]]])
    end
    it 'Can add multiple orders' do
      order.place_order("Blueberry Muffin", 1)
      order.place_order("Choc Mudcake", 1)
      expect(order.current_order.length).to eq(2)
    end
  end

end
