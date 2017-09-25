class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @apartments = Apartment.all
  end
end
