class TripsController < ApplicationController

  before_action :authorize, only: [:index]

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
    redirect_to user_trips_path # is this correct?
  end


end

# create_table "trips", force: true do |t|
#   t.integer  "start_station_id"
#   t.integer  "end_station_id"
#   t.integer  "user_id"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.string   "start_address"
#   t.float    "start_lat"
#   t.float    "start_long"
#   t.string   "end_address"
#   t.float    "end_lat"
#   t.float    "end_long"
#   t.float    "start_station_latitude"
#   t.float    "start_station_longitude"
#   t.float    "end_station_latitude"
#   t.float    "end_station_longitude"
#   t.string   "start_station_label"
#   t.string   "end_station_label"
# end



