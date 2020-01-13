require 'rails_helper'

RSpec.describe Passenger, type: :model do
    describe 'validations' do 
        it {should validate_presence of :name}
        it {should validate_presence of :age}
        it {should validate_numericality of :age}

    end 

    describe 'relationships' do

    end 
end 