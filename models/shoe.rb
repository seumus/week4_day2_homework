require('pg')
require_relative('../db/sql_runner')

class Customer

  attr_accessor(:name,:address,:size,:quantity)

  def initialize(options)
    @name = options['name']
    @address = options['address']
    @size = options['size'].to_i
    @quantity = options['quantity'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name,address,size,quantity) VALUES ('#{@name}','#{@address}',#{@size},#{@quantity})"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    orders = SqlRunner.run(sql)
    result = orders.map {|order| Customer.new(order)}
    return result
  end

end
