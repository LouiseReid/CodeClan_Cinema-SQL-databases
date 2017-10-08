require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :time, :film_id, :capacity

  def initialize(options)
    @id = options['id'].to_i
    @time = options['time']
    @film_id = options['film_id'].to_i
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (time, film_id, capacity) VALUES ($1, $2, $3)
        RETURNING id;"
    values = [@time, @film_id, @capacity]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET (time, film_id, capacity) = ($1, $2, $3)
          WHERE id = $4;"
    values = [@time, @film_id, @capacity, @id]
    SqlRunner.run(sql, values)
  end

# not convinced this is giving me the answer i want as you'd have to
# check each screening and film to see the one with the most tickets sold?
# The query does show it at a glance in table format though...?
  def tickets_per_screening(film)
    sql = "SELECT screening_id, COUNT(*) AS QTY FROM tickets
    WHERE film_id = tickets.film_id
    GROUP BY screening_id;"
    values = []
    most_popular_screening = SqlRunner.run(sql, values)
    return most_popular_screening.first
  end


  def capacity_check(film)
    if film.num_customers_in_film < @capacity
      return "tickets available"
    else
      return "this showing is full"
    end
  end





end
