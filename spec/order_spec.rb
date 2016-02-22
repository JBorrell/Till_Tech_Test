require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  it 'Returns items with the price' do
    expect(order.menu).to include("Americano" => 3.75)
  end

  it 'Starts with an empty order' do
    expect(order.current_order).to eq([])
  end

end
