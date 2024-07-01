class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.name, airport.id] }
    @passenger_options = [1, 2, 3, 4]
    @date_options = Flight.order(:date).pluck(:date).map { |d| d.to_date }.uniq.map { |d| [d.strftime('%Y-%m-%d'), d] }

    @flights = if params[:search]
                 Flight.search(params).includes(:departure_airport, :arrival_airport)
               else
                 Flight.includes(:departure_airport, :arrival_airport).all
               end
  end
end
