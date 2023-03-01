class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.drag = params[:drag_id]
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :location)
  end
end
