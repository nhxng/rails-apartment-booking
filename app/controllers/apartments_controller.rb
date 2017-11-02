class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @apartments = Apartment.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@apartments) do |apartment, marker |
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.picture({
                  :url    => "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png",
                  #:url    => view_context.image_path("noun_comment.svg"),
                  #:url    => ActionController::Base.helpers.image_path('noun_comment.png'),
                  :width  => 32,
                  :height => 30
                 })
      marker.title   "i'm the title"
      marker.infowindow render_to_string(partial: "/apartments/map_box", locals: { apartment: apartment })
    end
    @result = request.remote_ip
    @test_ip = Geocoder.coordinates("95.91.211.65")
    #@result = Geocoder.coordinates(@test_ip)
    #@result = Apartment.near("88.73.63.150")
    @apartment1 = Apartment.find(9)
    @apartment2 = Apartment.find(10)
    @distance_apartment = @apartment1.distance_to(@apartment2)

    Apartment.all.each do |apartment|
      calculated_distance = Geocoder::Calculations.distance_between(@test_ip, Geocoder.coordinates(apartment.address))
      apartment.update(distance: calculated_distance.round(2))
    end
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
