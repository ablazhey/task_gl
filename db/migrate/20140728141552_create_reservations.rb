class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
