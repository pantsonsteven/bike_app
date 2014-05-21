class DropStationsSchema < ActiveRecord::Migration
  def up
    drop_table :stations 
  end

  def down
    create_table :stations do |t|
      t.float    "latitude"
      t.float    "longitude"
      t.integer  "station_id"
      t.string   "label"
    end
  end
end
