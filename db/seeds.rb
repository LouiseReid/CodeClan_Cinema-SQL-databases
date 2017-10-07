require_relative('../models/customers')
require_relative('../models/films')
require_relative('../models/tickets')
require_relative('../models/screenings')

require('pry-byebug')


Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Louise', 'funds' => 20, 'age' => 29})
customer2 = Customer.new({'name' => 'Steve', 'funds' => 25, 'age' => 18})
customer3 = Customer.new({'name' => 'Jo', 'funds' => 15, 'age' => 15})
customer4 = Customer.new({'name' => 'Alanna', 'funds' => 10, 'age' => 13})
customer5 = Customer.new({'name' => 'Fred', 'funds' => 12, 'age' => 22})
customer6 = Customer.new({'name' => 'Ruth', 'funds' => 10, 'age' => 17})

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()


film1 = Film.new({'title' => 'IT', 'price' => 8, 'rating' => 18})
film2 = Film.new({'title' => 'T2', 'price' => 5, 'rating' => 15})
film3 = Film.new({'title' => 'The Lion King', 'price' => 3, 'rating' => 12})
film4 = Film.new({'title' => 'Dunkirk', 'price' => 5, 'rating' => 15})

film1.save()
film2.save()
film3.save()
film4.save()

screening1 = Screening.new({'time' => '20.00', 'film_id' => film1.id, 'capacity' => 200})
screening2 = Screening.new({'time' => '21.30', 'film_id' => film2.id, 'capacity' => 200})
screening3 = Screening.new({'time' => '16.00', 'film_id' => film3.id, 'capacity' => 100})
screening4 = Screening.new({'time' => '19.30', 'film_id' => film4.id, 'capacity' => 150})
screening5 = Screening.new({'time' => '22.30', 'film_id' => film1.id, 'capacity' => 100})


screening1.save()
screening2.save()
screening3.save()
screening4.save()
screening5.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id, 'screening_id' => screening2.id})
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film3.id, 'screening_id' => screening3.id})
ticket5 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film4.id, 'screening_id' => screening4.id})
ticket6 = Ticket.new({'customer_id' => customer6.id, 'film_id' => film1.id, 'screening_id' => screening5.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()





binding.pry
nil
