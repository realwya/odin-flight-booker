# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_02_030006) do
  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_passengers", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "passenger_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_passengers_on_booking_id"
    t.index ["passenger_id"], name: "index_booking_passengers_on_passenger_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "booking_date"
    t.integer "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "date"
    t.integer "duration_in_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "departure_airport_id"
    t.integer "arrival_airport_id"
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_passengers", "bookings"
  add_foreign_key "booking_passengers", "passengers"
  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
end
