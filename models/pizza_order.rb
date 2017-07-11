require('pg')

#create pizza order class fname, lname, quantity, topping id
#save, update deleteall, delete, all

class PizzaOrder

  attr_accessor :first_name, :last_name, :topping, :quantity

  def initialize(options)
    @id = options[:id].to_i if options[:id]
    @first_name = options[:first_name]
    @last_name = options[:last_name]
    @topping = options[:topping]
    @quantity = options[:quantity]
    @db = PG.connect(dbname: 'pizza_orders', host: 'localhost')
  end

  def save
    db = PG.connect(dbname: 'pizza_orders', host: 'localhost')

    sql = "INSERT INTO pizza_orders (first_name, last_name, topping, quantity) VALUES ('#{@first_name}', '#{@last_name}', '#{@topping}', #{@quantity}) RETURNING id;"
    @id = db.exec(sql)[0]['id']
    db.close
  end

  def update
    db = PG.connect({dbname: 'pizza_orders', host: 'localhost'})
    sql = "UPDATE pizza_orders SET (first_name, last_name, topping, quantity) = ('#{@first_name}', '#{@last_name}', '#{@topping}', '#{@quantity}') WHERE id = '#{@id}'"
    db.exec(sql)
    db.close
  end

  def delete
    db = PG.connect(dbname: 'pizza_orders', host: 'localhost')
    sql = "DELETE FROM pizza_orders WHERE id = '#{@id}'"
    db.exec(sql)
    p "Object deleted from DB"
    db.close
  end

  def self.delete_all
    db = PG.connect(dbname: 'pizza_orders', host: 'localhost')
    sql = "DELETE FROM pizza_orders"
    db.exec(sql)
    db.close
  end

  def self.all

  end



end