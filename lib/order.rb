require 'json'

class Order
  def menu
    restaurant = File.read('hipstercoffee.json')
    food = JSON.parse(restaurant)
    return food[0]['prices'][0]
  end
end
