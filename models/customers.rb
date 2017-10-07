require_relative("../db/sql_runner")


class Customer

  attr_reader :id
  attr_accessor :name, :funds, :age

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds, age) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @funds, @age]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds, age) = ($1, $2, $3)
      WHERE id = $4;"
    values = [@name, @funds, @age, @id]
    SqlRunner.run(sql, values)
  end

  def film_booked()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    film_booked = SqlRunner.run(sql, values)
    return film_booked.map { |film| Film.new(film)  }
  end

  def buy_ticket(film)
    @funds -= film.price
    update()
  end

  def allowed_entry(film)
    if @age >= film.rating
      return true
    end
    else return "you're too young for this one!"
  end
end
