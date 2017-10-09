class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new
    @booking.user = current_user if current_user
    @apartment = Apartment.find(booking_params[:apartment_id].to_i)
    @booking.start_date = booking_params[:start_date].to_date
    @booking.end_date  = booking_params[:end_date].to_date
    @booking.apartment = @apartment
    if @booking.save
      redirect_to apartment_path(@apartment)
    else
      flash[:error] =  @booking.errors.full_messages[0]
      redirect_to apartment_path(@apartment)
    end

  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :apartment_id)
  end
end
