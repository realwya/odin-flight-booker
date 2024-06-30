class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| airport.code }
    @flights = Flight.where(
      departure_airport_id: params[:departure_airport_id],
      arrival_airport_id: params[:arrival_airport_id],
      date: params[:flight_date]
    )
  end
end
