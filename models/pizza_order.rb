require('pg')

#create pizza order class fname, lname, quantity, topping id
#save, update deleteall, delete, all

class PizzaOrder


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
    @id = db.exec_params(sql)[0]['id']
    db.close
  end

  def update

  end

  def delete

  end

  def delete_all

  end

  def all

  end



end