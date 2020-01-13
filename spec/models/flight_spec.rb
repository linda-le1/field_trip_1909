require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'methods' do
    it "can calculate the number of minors and adults" do
      
    southwest = Airline.create(name: "Southwest")
    southwest_1 = southwest.flights.create(number: "SW1", date: "10/10/20", time: "1300", departure_city: "Minneapolis", arrival_city: "Nashville")
    linda = Passenger.create(name: "Linda", age: 28)
    dave = Passenger.create(name: "Dave", age:32)
    jordy = Passenger.create(name: "Jordy", age:6)
    milly = Passenger.create(name: "Milly", age:3)
    southwest_1.passengers << linda
    southwest_1.passengers << dave
    southwest_1.passengers << jordy
    southwest_1.passengers << milly

    expect(southwest_1.number_of_minors).to eq 2
    expect(southwest_1.number_of_adults).to eq 2
    end
  end
end
