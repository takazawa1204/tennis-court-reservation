class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :court_name
      t.integer :user_id
      t.datetime :reservation_time

      t.timestamps
    end
  end
end
