class AddColumnLocationToBoats < ActiveRecord::Migration
  def change
  	add_column :boats, :location, :string
  end
end
