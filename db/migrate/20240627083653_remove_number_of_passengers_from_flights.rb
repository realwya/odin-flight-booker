class RemoveNumberOfPassengersFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :number_of_passengers, :integer
  end
end
