class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create

    # "start_coordinates" and "end_coordinates" are arrays of lat and long

    if (param.require(:trip).permit.(:current_address) == false )
      start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:start_address)) 
    else
      # need to get IP address here!!!
      start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:current_address))

    end_coordinates = Geocoder.coordinates(params.require(:trip).permit(:end_address))

    nearest(start_coordinates, end_coordinates)

    new_trip = Trip.create(#########)
    redirect_to trip_path(@trip) 
  end


end
