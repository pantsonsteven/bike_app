class TripsController < ApplicationController

  def index
    @trips = User.find(current_user).trips
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @trip = Trip.new(:user => @user)
  end

  def create

    if params[:current_address] == 'true'
      start_address = request.remote_ip
    else
      start_address = params.require(:trip).permit(:start_address)['start_address']
    end

    end_address = params.require(:trip).permit(:end_address)['end_address']

    trip = Trip.new_trip(start_address, end_address)

    current_user.trips << trip

    redirect_to user_trip_path(:id => trip.id)
  end

  def destroy
    Trip.delete(params[:id])
    redirect_to user_trips_path
  end

end
