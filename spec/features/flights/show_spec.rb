require 'rails_helper'

RSpec.describe "Flights Show Spec" do
  describe "When I visit the flights show page" do
    it 'I can see the information for that flight' do
      southwest = Airline.create(name: "Southwest")

      southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      southwest_2 = southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      linda = Passenger.create(name: "Linda", age: 28)
      dave = Passenger.create(name: "Dave", age:32)

      southwest_1.passengers << linda
      southwest_1.passengers << dave

      visit "/flights/#{southwest_1.id}"

      expect(page).to have_content("#{southwest.name}")
      expect(page).to have_content("Flight Number: #{southwest_1.number}")
      expect(page).to have_content("Date: #{southwest_1.date}")
      expect(page).to have_content("Time: #{southwest_1.time}")
      expect(page).to have_content("Departing From: #{southwest_1.departure_city}")
      expect(page).to have_content("Arriving At: #{southwest_1.arrival_city}")
      expect(page).to have_content("#{linda.name}")
      expect(page).to have_content("#{dave.name}")

    end
  end
end
