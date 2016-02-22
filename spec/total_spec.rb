require 'total'

describe 'Total' do
  before(:each) do
    @current_order = [["Americano", [4, 3.75]], ["Tiramisu", [2, 11.40]]]
  end
  
  subject(:total) {Total.new(@current_order)}

  it 'Calculates the total of ordered food' do
    expect(total.order_sum).to eq(37.8)
  end
end
