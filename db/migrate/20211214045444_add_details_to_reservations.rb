class AddDetailsToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :count, :integer
    add_column :reservations, :calendar_id, :integer
    add_column :reservations, :reservation_status, :integer, default:0
  end
end
