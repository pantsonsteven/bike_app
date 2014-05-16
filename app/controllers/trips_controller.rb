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

  start_coordinates = Geocoder.coordinates(params.require(:trip).permit(:start_address)) 
  end_coordinates = Geocoder.coordinates(params.require(:trip).permit(:end_address))

    new_trip = Trip.create(trip_params)
    redirect_to trip_path(@trip) 
  end


end
