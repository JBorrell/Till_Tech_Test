require 'json'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def menu
    restaurant = File.read('hipstercoffee.json')
    food = JSON.parse(restaurant)
    return food[0]['prices'][0]
  end
end
