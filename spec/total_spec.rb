require 'total'

describe 'Total' do
  describe 'Orders under 50' do
    before(:each) do
    @current_order = [["Americano", [4, 3.75]], ["Tiramisu", [2, 11.40]]]

    end

    subject(:total) {Total.new(@current_order)}

    it 'Calculates the total of ordered food' do
      expect(total.order_sum).to eq(37.8)
    end

    it 'Displays tax to be added' do
      total.order_sum
      expect(total.tax).to eq(3.27)
    end

    it 'Adds tax to order on checkout' do
      expect(total.grand_total).to eq(41.07)
    end
  end

  describe 'Order over 50' do
    it 'Should give a 5% discount on orders over 50' do
      @current_order = [["Americano", [4, 3.75]], ["Tiramisu", [2, 11.40]], ["Affogato", [1, 14.8]]]
      big_total = Total.new(@current_order)
      expect(big_total.grand_total).to eq(54.28)
    end
  end
  describe 'Should give a 10% discount on Muffins' do
    it 'Blueberry Muffin total should equal 3.65' do
      @current_order = [["Blueberry Muffin", [1, 4.05]]]
      muffin_order = Total.new(@current_order)
      expect(muffin_order.grand_total).to eq(3.95)
    end
  end
end
