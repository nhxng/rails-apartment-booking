class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
    @bookings = @apartment.bookings
    @booking = Booking.new
  end
end
