class AddStationLatAndLongToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_station_latitude, :float
    add_column :trips, :start_station_longitude, :float
    add_column :trips, :end_station_latitude, :float
    add_column :trips, :end_station_longitude, :float
    add_column :trips, :start_station_label, :string
    add_column :trips, :end_station_label, :string 
    rename_column :trips, :start_station, :start_station_id 
    rename_column :trips, :end_station, :end_station_id 
  end
end
