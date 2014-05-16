class DropColumnsFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :start_address
    remove_column :trips, :start_lat
    remove_column :trips, :start_long
    remove_column :trips, :end_adress
    remove_column :trips, :end_lat
    remove_column :trips, :end_long
  end
end
