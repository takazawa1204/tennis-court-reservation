class ReservationsController < ApplicationController

  def new
    @reservations = Reservation.all
    @user = @current_user
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    # byebug
    # if @reservation.invalid? #入力項目に空のものがあれば入力画面に遷移
    #   render :index
    # end
  end
  
  # def new
  #   @reservation = Reservation.find_or_initialize_by(id: params[:id])
  #   @reservation.assign_attributes(reservation_params)
  # end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @current_user.id
    if params[:back] || !@reservation.save
      @reservations = Reservation.all
      @user = @current_user
      @today = Date.today
      from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
      to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
      @calendar_data = from_date.upto(to_date)
      render :new and return
    elsif @reservation.save
      redirect_to user_path(@current_user)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to new_reservations_path
    
  end

  private

  def reservation_params
    params.require(:reservation).permit(:count, :reservation_time, :reservation_status, :reservation_day)
  end

end
