# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

southwest = Airline.create(name: "Southwest")

southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
southwest_3 = southwest.flights.create(number: "SW3", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "New York City")

linda = Passenger.create(name: "Linda", age: 28)
milly = Passenger.create(name: "Milly", age: 3)

southwest_1.passengers << linda
southwest_2.passengers << linda
southwest_1.passengers << milly
