class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.integer :duration_in_minutes
      t.integer :number_of_passengers

      t.timestamps
    end
  end
end
