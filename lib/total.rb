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

  def tax
    @tax = (@total * 0.0864).round(2)
    return @tax
  end

  def grand_total
    @total = order_sum + tax
    return @total.round(2)
  end

end
