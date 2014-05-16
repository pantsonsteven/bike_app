class RemoveDateFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :date
  end

  def down
    add_column :trips, :date, :date
  end
end
