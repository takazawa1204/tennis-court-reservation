class Reservation < ApplicationRecord
  belongs_to :user
  
  enum reservation_status: {
    availability: 0,
    reserved: 1
  }
  
    @user = @current_user
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
  
end
