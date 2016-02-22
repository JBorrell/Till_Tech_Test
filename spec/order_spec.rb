require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  it 'Returns items with the price' do
    expect(order.menu).to include("Americano" => 3.75)
  end
  
end
