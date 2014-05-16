class CorrectSpellingOnTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :end_addresss, :end_address
  end
end
