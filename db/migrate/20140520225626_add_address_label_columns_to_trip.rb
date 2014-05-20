class AddAddressLabelColumnsToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :start_address_label, :string
    add_column :trips, :end_address_label, :string
  end
end
