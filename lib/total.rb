class Total

  def initialize(order)
    @total = 0
    @order = order
  end

  def order_sum
    @order.each do |i|
      sum = i[1].inject(:*)
      sum -= (sum * 0.1) if i[0].include?("Muffin")
      @total += sum
    end
    return @total
  end

  def tax
    @tax = (@total * 0.0864).round(2)
    return @tax
  end

  def grand_total
    @total = order_sum + tax
    @total -= discount(@total) if @total > 50
    return @total.round(2)
  end

private

  def discount(total)
    return (total * 0.05)
  end

end
