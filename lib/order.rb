require 'json'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def menu
    menu_hash
  end

  def place_order(food, amount)
    @current_order << [food, [amount, prices(food)]]
  end

private

  def menu_hash
    restaurant = File.read('hipstercoffee.json')
    food = JSON.parse(restaurant)
    return food[0]['prices'][0]
  end

  def prices(food)
    return menu_hash[food]
  end
end
