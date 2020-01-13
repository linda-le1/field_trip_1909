class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    flight = Flight.where(number: params[:number])
    passenger.flights << flight
    redirect_to "/passengers/#{passenger.id}"
  end

end
