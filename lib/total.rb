class Total

  def initialize(order)
    @total = 0
    @order = order
  end

  def order_sum
    @order.each do |i|
      @total += i[1].inject(:*)
    end
    return @total
  end

  

end
