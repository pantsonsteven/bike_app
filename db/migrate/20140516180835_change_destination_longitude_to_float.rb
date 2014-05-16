class ChangeDestinationLongitudeToFloat < ActiveRecord::Migration
  def up
    remove_column :trips, :destination_long
    remove_column :trips, :float
    add_column :trips, :destination_long, :float
  end

  def down
    remove_column :trips, :destination_long
    add_colum :trips, :destination_long, :string
    add_column :trips, :float, :string 
  end
end
