class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :origin
      t.integer :trip
      t.string :destination
      t.datetime :scheduled_time
      t.column :lateness, :interval
      t.integer :track
      t.string :status

      t.timestamps
    end
  end
end
