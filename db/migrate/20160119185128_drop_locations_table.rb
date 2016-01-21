class DropLocationsTable < ActiveRecord::Migration
 def change
    drop_table :locations do |t|
      t.string :city, null: false
      t.string :country, null: false
      t.timestamps null: false
    end
  end
end
