class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :boat_name
      t.integer :container_cap
      t.string :job
      t.integer :user_id
      t.string :location

      t.timestamps null: false
    end
  end
end
