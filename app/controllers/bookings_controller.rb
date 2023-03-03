class BookingsController < ApplicationController
  def new
    @drag = Drag.find(params[:drag_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @drag = Drag.find(params[:drag_id])
    @booking = Booking.new(params_booking)
    @booking.drag = @drag
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index #Dashboard?
    @booking.user = current_user
    @bookings = Booking.find(user_id: @booking.user)
    @bookings = policy_scope(Booking)
  end

  def edit
    @booking = Booking.find(params[:id])
    @drag = @booking.drag
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(params_booking)
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def params_booking
    params.require(:booking).permit(:start_time, :end_time, :location, :status)
  end
end
