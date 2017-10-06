require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :time_of_screening, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @time_of_screening = options['time_of_screening']
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (time_of_screening, film_id) VALUES ($1, $2)
        RETURNING id;"
    values = [@time_of_screening, @film_id]
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
    sql = "UPDATE screenings SET (time_of_screening, film_id) = ($1, $2)
          WHERE id = $3;"
    values = [@time_of_screening, @film_id, @id]
    SqlRunner.run(sql, values)
  end

# this one doesn't work, expecting to return 21.00 as it is the start time
# with the most films. Error message - undefined method 'mode'
  def self.most_films_at_time()
    sql = "SELECT screenings.*, films.title FROM screenings
          INNER JOIN films
          ON films.id = screenings.film_id;"
    values = []
    most_films_at_time = SqlRunner.run(sql, values)
    return most_films_at_time.mode
  end



end
