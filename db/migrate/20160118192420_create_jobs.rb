class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_name
      t.integer :containers_needed
      t.integer :user_id
      t.integer :boat_id
      t.decimal :cost
      t.string :origin
      t.string :destination
      t.text :cargo
      t.timestamps null: false
    end
  end
end
