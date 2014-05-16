class RenameEndLoc < ActiveRecord::Migration
  def change
    rename_column :trips, :end_loc, :end_location
  end
end
