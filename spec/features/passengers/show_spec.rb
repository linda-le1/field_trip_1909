require 'rails_helper'

RSpec.describe "Passengers Show Page" do
  describe "When I visit the passengers show page" do

    before :each do
      @southwest = Airline.create(name: "Southwest")

      @southwest_1 = @southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
      @southwest_2 = @southwest.flights.create(number: "SW2", date: "12/08/19", time: "0900", departure_city: "Baltimore", arrival_city: "Oakland")
      @southwest_3 = @southwest.flights.create(number: "SW3", date: "10/10/20", time: "1300", departure_city: "Denver", arrival_city: "New York City")

      @linda = Passenger.create(name: "Linda", age: 28)
      @dave = Passenger.create(name: "Dave", age:32)

      @southwest_1.passengers << @linda
      @southwest_2.passengers << @linda
    end

    it 'I can see the name of and flights for that passenger' do

      visit "/passengers/#{@linda.id}"

      expect(page).to have_content("Flights for #{@linda.name}")
      expect(page).to_not have_content("Flights for #{@dave.name}")

      within "#flight-#{@southwest_1.id}" do
        expect(page).to have_content("Flight Number: #{@southwest_1.number}")
      end

      within "#flight-#{@southwest_2.id}" do
        expect(page).to have_content("Flight Number: #{@southwest_2.number}")
      end

    end

    it 'I can click on a flight number for that passenger and go to the flight show page' do

      visit "passengers/#{@linda.id}"

      within "#flight-#{@southwest_1.id}" do
        expect(page).to have_link("#{@southwest_1.number}")
        click_on("#{@southwest_1.number}")
        expect(current_path).to eq "/flights/#{@southwest_1.id}"
      end

    end

    it 'I can add a flight to the passenger' do

      visit "passengers/#{@linda.id}"

      fill_in 'number',      with: 'SW3'
      click_button 'Add Flight'

      expect(current_path).to eql "passengers/#{@linda.id}"
      expect(page).to have_content("Flight Number: #{@southwest_3.number}")

    end
  end
end 
