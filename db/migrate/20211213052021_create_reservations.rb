class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :count
      t.integer :user_id
      t.integer :reservation_time
      t.date :reservation_day
      t.timestamps
    end
  end
end
