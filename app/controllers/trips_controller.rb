class TripsController < ApplicationController

  before_action:current_user

  def index
    @trips = @current_user.trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @trip = Trip.new(:user => @user)
  end

  def create

    # "start_coordinates" and "end_coordinates" are arrays of lat and long

    # if (param.require(:trip).permit.(:current_address) == false )
    #   start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:start_address)) 
    # else
    #   # need to get IP address here!!!
    #   start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:current_address))
    # end   

    start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:start_address)) 

    end_coordinates = Geocoder.coordinates(params.require(:trip).permit(:end_address))

    Trip.nearest(start_coordinates, end_coordinates)

    # new_trip = Trip.create(#########)
    redirect_to "/users/:user_id/trips/:id" # is this correct?
  end


end









