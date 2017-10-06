class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cost, :apartment_id)
  end
end
