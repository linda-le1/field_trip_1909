require 'rails_helper'

RSpec.describe Passenger, type: :model do
    describe 'validations' do
        it {should validate_presence_of :name}
        it {should validate_presence_of :age}
        it {should validate_numericality_of :age}

    end

    describe 'relationships' do
        it {should have_many(:flights).through(:flight_passengers)}
    end
end
