require 'rails_helper'

RSpec.describe "Passengers Show Page" do

  before :each do
    @southwest = Airline.create(name: "Southwest")

    @southwest_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
    @southwest_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")

    @linda = Passenger.create(name: "Linda", age: 28)
    @dave = Passenger.create(name: "Dave", age:32)

    @southwest_1.passengers << @linda
    @southwest_2.passengers << @linda
  end

  describe "When I visit the passengers show page" do
    it 'I can see the name of and flights for that passenger' do

      visit "/passengers/#{@linda.id}"

      expect(page).to have_content("Flights for #{@linda.name}")
      expect(page).to_not have_content("Flights for #{@dave.name}")

      within "#flight-#{@southwest_1.id}" do
        expect(page).to have_link("Flight Number: #{@southwest_1.id}")
      end

      within "#flight-#{@southwest_2.id}" do
        expect(page).to have_link("Flight Number: #{@southwest_2.id}")
      end

    end

    it 'I can click on a flight number for that passenger and go to the flight show page' do

      visit "passengers/#{@linda.id}"

      within "#flight-#{@southwest_1.id}" do
        expect(page).to have_link("Flight Number: #{@southwest_1.id}")
        click_on("Flight Number: #{@southwest_1.id}")
        expect(current_path).to eq "/flights/#{@southwest_1.id}"
      end
    end
  end
end
