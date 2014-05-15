class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :date
      t.integer :start_station
      t.integer :end_station
      t.string :origin
      t.float :origin_lat
      t.string :origin_long
      t.string :destination
      t.float :destination_lat
      t.string :destination_long
      t.string :float
      t.references :user
      
      t.timestamps
    end
  end
end
