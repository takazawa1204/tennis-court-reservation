class AddReservationDayToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :reservation_day, :date
  end
end
