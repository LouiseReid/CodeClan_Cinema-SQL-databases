require_relative('../models/customers')
require_relative('../models/films')
require_relative('../models/tickets')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Louise', 'funds' => 20})
customer2 = Customer.new({'name' => 'Steve', 'funds' => 25})
customer3 = Customer.new({'name' => 'Jo', 'funds' => 15})
customer4 = Customer.new({'name' => 'Alanna', 'funds' => 10})

customer1.save()
customer2.save()
customer3.save()
customer4.save()


film1 = Film.new({'title' => 'IT', 'price' => 8})
film2 = Film.new({'title' => 'T2', 'price' => 5})
film3 = Film.new({'title' => 'The Lion King', 'price' => 3})
film4 = Film.new({'title' => 'Dunkirk', 'price' => 5})

film1.save()
film2.save()
film3.save()
film4.save()

ticket1 = Ticket.new({'customer_id' => customer1.id,
                      'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id,
                      'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer3.id,
                      'film_id' => film3.id})
ticket4 = Ticket.new({'customer_id' => customer4.id,
                      'film_id' => film4.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()

binding.pry
nil
