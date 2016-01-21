class RemoveLocationColumnFromBoats < ActiveRecord::Migration
  def change
  	remove_column :boats, :location, :string
  end
end
