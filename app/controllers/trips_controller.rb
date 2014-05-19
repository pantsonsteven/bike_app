class TripsController < ApplicationController

  before_action :authorize, only: [:index]

  def index

  end

  # def show
  #   @trip = Trip.find(params[:id])
  # end

  def new
    @user = User.find(params[:user_id])
    @trip = Trip.new(:user => @user)
  end

  def create

    if params[:current_address] == 'true'
      start_address = request.remote_ip
      start_coordinates = Geocoder.coordinates(start_address)
    else
      start_address = params.require(:trip).permit(:start_address)['start_address']
      start_coordinates = Geocoder.coordinates(start_address) 
    end   

    end_address = params.require(:trip).permit(:end_address)['end_address']
    end_coordinates = Geocoder.coordinates(end_address)

    binding.pry

    Trip.nearest(start_address, end_address, start_coordinates, end_coordinates)

    redirect_to user_trips_path # is this correct?

  end


end




