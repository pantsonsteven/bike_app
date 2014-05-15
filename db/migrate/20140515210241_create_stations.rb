class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.float :latitude
      t.float :longitude
      t.integer :station_id
      t.string :label

      t.timestamps
    end
  end
end
