class ChangeNamesOfOriginAndDestination < ActiveRecord::Migration
  def change
    rename_column :trips, :origin, :start_address
    rename_column :trips, :destination, :end_adress
    rename_column :trips, :origin_lat, :start_lat
    rename_column :trips, :origin_long, :start_long
    rename_column :trips, :destination_lat, :end_lat
    rename_column :trips, :destination_long, :end_long
  end
end
