require 'rails_helper'

RSpec.describe "Flights Show Spec" do
  describe "When I visit the flights show page" do
    before :each do
      @southwest = Airline.create(name: "Southwest")

      @southwest_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @southwest_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

      @linda = Passenger.create(name: "Linda", age: 28)
      @dave = Passenger.create(name: "Dave", age:32)
      @jordy = Passenger.create(name: "Jordy", age:6)

      @southwest_1.passengers << @linda
      @southwest_1.passengers << @dave
      @southwest_1.passengers << @jordy

    end
      it 'I can see the information for that flight' do

      visit "/flights/#{@southwest_1.id}"

      expect(page).to have_content("#{@southwest.name}")
      expect(page).to have_content("Flight Number: #{@southwest_1.number}")
      expect(page).to have_content("Date: #{@southwest_1.date}")
      expect(page).to have_content("Time: #{@southwest_1.time}")
      expect(page).to have_content("Departing From: #{@southwest_1.departure_city}")
      expect(page).to have_content("Arriving At: #{@southwest_1.arrival_city}")
      expect(page).to have_content("#{@linda.name}")
      expect(page).to have_content("#{@dave.name}")

      expect(page).to_not have_content("Flight Number: #{@southwest_2.number}")
      expect(page).to_not have_content("Date: #{@southwest_2.date}")
      expect(page).to_not have_content("Time: #{@southwest_2.time}")
      expect(page).to_not have_content("Departing From: #{@southwest_2.departure_city}")
      expect(page).to_not have_content("Arriving At: #{@southwest_2.arrival_city}")

    end

    it "can see the number of minors and adults on flight" do

      visit "/flights/#{@southwest_1.id}"

      expect(page).to have_content("Number of Minors: 1")
      expect(page).to have_content("Number of Adults: 2")

    end
  end
end
