class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.references :flight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
