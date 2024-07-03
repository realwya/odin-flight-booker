class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :date, :duration_in_minutes, presence: true

  scope :on_date, ->(date) { where(date: date.beginning_of_day..date.end_of_day) }
  scope :from_airport, ->(airport_id) { where(departure_airport_id: airport_id) }
  scope :to_airport, ->(airport_id) { where(arrival_airport_id: airport_id) }

  def self.search(params)
    flights = all
    flights = flights.from_airport(params[:departure_airport_id]) if params[:departure_airport_id].present?
    flights = flights.to_airport(params[:arrival_airport_id]) if params[:arrival_airport_id].present?
    flights = flights.on_date(params[:flight_date].to_date) if params[:flight_date].present?
    flights
  end
end
