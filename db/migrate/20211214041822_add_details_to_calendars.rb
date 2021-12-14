class AddDetailsToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :calendar_day, :datetime
    add_column :calendars, :calendar_time, :time
  end
end
