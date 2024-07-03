class Booking < ApplicationRecord
  belongs_to :flight
  has_many :booking_passengers
  has_many :passengers, through: :booking_passengers

  accepts_nested_attributes_for :passengers
end
