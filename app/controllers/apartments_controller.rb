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

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
  end

  private
  def apartment_params
    params.require(:apartment).permit(:title, :accomodation_type, :beds, :bedrooms, :bathrooms, :guests, :equipment, :city, :address, :price_per_night, :user_id, :apartment_id)
  end
end
