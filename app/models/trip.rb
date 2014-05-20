class Trip < ActiveRecord::Base

  belongs_to :user



  def self.new_trip(start_address, end_address)
    start_coordinates = address_coordinates(start_address)
    end_coordinates = address_coordinates(end_address)

    start_station = nearest_station(start_coordinates)
    end_station = nearest_station(end_coordinates)

    start_address_label = coordinates_address(start_coordinates)
    end_address_label = coordinates_address(end_coordinates)

    trip = trip_hash(start_station, end_station, start_address, end_address, start_coordinates, end_coordinates, start_address_label, end_address_label)

    self.create(trip)
    
  end



  def self.address_coordinates(address)
    Geocoder.coordinates(address)
  end

  def self.coordinates_address(coordinates)
    Geocoder.address(coordinates)
  end



  def self.nearest_station(address_coordinates)
    all_stations = Citibikenyc.branches["results"]
    station_array = []

    all_stations.each do |station|

      distance_from_address = Geocoder::Calculations.distance_between(address_coordinates, [(station['latitude']),(station['longitude'])])

      station_info = { 
        :station_id => (station['id']), 
        :label => (station['label']), 
        :latitude => (station['latitude']),
        :longitude => (station['longitude']),
        :distance => distance_from_address 
      }

      station_array << station_info
    end

    sorted = station_array.sort{ |x, y| x[:distance] <=> y[:distance] }

    sorted.each do |station|
      return station if station_state(station[:station_id]).fetch("status", "not active") == "Active" &&  station_state(station[:station_id]).fetch("availableBikes", 0).to_i > 0
    end

  end

 


  def self.trip_hash(start_station, end_station, start_address, end_address, start_coordinates, end_coordinates, start_address_label, end_address_label)
    {
      :start_station_id => start_station[:station_id],
      :start_station_label => start_station[:label],
      :start_station_latitude => start_station[:latitude],
      :start_station_longitude => start_station[:longitude],
      :end_station_id => end_station[:station_id],
      :end_station_label => end_station[:label],
      :end_station_latitude => end_station[:latitude],
      :end_station_longitude => end_station[:longitude],
      :start_address => start_address,
      :start_lat => start_coordinates[0],
      :start_long => start_coordinates[1],
      :end_address => end_address,
      :end_lat => end_coordinates[0],
      :end_long => end_coordinates[1],
      :start_address_label => start_address_label,
      :end_address_label => end_address_label
    }
  end



  def total_distance
    ( Geocoder::Calculations.distance_between([self.start_station_latitude, self.start_station_longitude], [self.start_lat, self.start_long]) + 
      Geocoder::Calculations.distance_between([self.start_lat, self.start_long], [self.end_lat, self.end_long]) + 
      Geocoder::Calculations.distance_between([self.end_lat, self.end_long], [self.end_station_latitude, self.end_station_longitude]) 
    ).round(2)
  end


  private 

  def self.station_state(id)
    station_activity_arr = Citibikenyc.stations_status["results"]
    station_activity_arr.each do |station|
      return station if station.id == id
    end
    {status: "Not Active"}
  end

end




# Citibikenyc.stations_status["results"]
# ___________________________
# [331] {
#                   "id" => 3002,
#               "status" => "Active",
#       "availableBikes" => 17,
#       "availableDocks" => 6
#   }


# bike_stations
# _____________
# {
#   :start => {
#     :station_id => 127,
#     :label => "One Court Square",
#     :latitude => 40.7467393577099,
#     :longitude => -73.9434874802828,
#     :distance => 0.5966593465631346
#     },
#     :end => {
#       :station_id => 228,
#       :label => "22 W. 32nd St",
#       :latitude => 40.7475128173828,
#       :longitude => -73.986946105957,
#       :distance => 0.09803588893167761
#     }
#   }







