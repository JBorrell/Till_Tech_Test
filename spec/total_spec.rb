require 'total'

describe 'Total' do
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
