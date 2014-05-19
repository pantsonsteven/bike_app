class TripsController < ApplicationController

  before_action:current_user

  def index
    @trips = @current_user.trips
  end

  # def show
  #   @trip = Trip.find(params[:id])
  # end

  def new
    @user = User.find(params[:user_id])
    @trip = Trip.new(:user => @user)
  end

  def create

    # "start_coordinates" and "end_coordinates" are arrays of lat and long
    
    if params[:current_address] == 'true'
      current_address = request.remote_ip
      start_coordinates = Geocoder.coordinates(current_address)
    else
      start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:start_address)) 
    end   
    binding.pry

    end_coordinates = Geocoder.coordinates(params.require(:trip).permit(:end_address))

    start_end = Trip.nearest(start_coordinates, end_coordinates)

    # new_trip = Trip.create(#########)
    redirect_to "/users/:user_id/trips/:id" # is this correct?
  end


end









