require_relative('pizza_order.rb')
require('pry')

order1 = PizzaOrder.new({first_name: "Chris", last_name: "Hunter", topping: "Cheese", quantity: 1})
order2 = PizzaOrder.new({first_name: "Stephen", last_name: "Beattie", topping: "Fromage", quantity: 1})

order1.save
order2.save
order2.first_name = "Stevie"
order2.update
order1.delete
PizzaOrder.delete_all