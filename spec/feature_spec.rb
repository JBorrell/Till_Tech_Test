require 'order'
require 'total'
require 'till'

# User Stories
#
# As a customer
# So I can select the food I want
# I want to see a menu with prices
#
# As a customer
# So that I can order the food I want
# I would like to place an order(2 x Cafe Latte, 1 x Bluberry Muffin, 1 x Choc Mudcake)
#
# As a customer
# So that I can pay the correct amount
# I would like to see the total cost of my order

describe 'Order' do
  subject(:order){ Order.new }
  it 'Customer places order & receives total' do
    order.place_order("Americano", 4)
    order.place_order("Tiramisu", 2)
    order.place_order("Blueberry Muffin", 5)
    expect(order.calculate_total).to eq(57.82)
  end
end

describe 'Till' do
  subject(:till){ Till.new }
  it 'Customer orders food, pays & receives change' do
    till.order_food("Cafe Latte", 2)
    till.order_food("Muffin Of The Day", 1)
    till.order_food("Choc Mudcake", 1)
    expect(till.order.current_order.length).to eq(3)
    till.pay(25)
    expect(till.change).to eq(3.27)
    expect(till.order.current_order).to eq([])
  end
end
