class AddLabelToStations < ActiveRecord::Migration
  def change
    add_column :stations, :label, :string
  end
end
