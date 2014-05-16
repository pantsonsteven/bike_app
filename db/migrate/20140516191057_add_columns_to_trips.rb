class AddColumnsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_location, :integer
    add_column :trips, :end_loc, :integer
    remove_column :trips, :date
  end
end
