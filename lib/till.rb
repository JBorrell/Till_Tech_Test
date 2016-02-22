require 'order'

class Till

  attr_reader :order

  def initialize
    @order = Order.new
  end

  def order_food(item, amount)
    @order.place_order(item, amount)
  end

  def pay(amount)
    raise("Insufficient Payment") if amount < @order.calculate_total
    calculate_change(amount)
    new_order
    return "Payment Accepted"
  end

  def change
    return @change.round(2)
  end

private

  def calculate_change(amount)
    @change = amount - @order.calculate_total
  end

  def new_order
    @order = Order.new
  end

end
