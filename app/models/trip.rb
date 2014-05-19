class Trip < ActiveRecord::Base
  belongs_to :user

  def self.nearest(start_address, end_address, start_coordinates, end_coordinates)

    # this method needs to return two (maybe more?) station objects, the one closest to the start address and the once closest to the end address

    i = 0

    bike_stations = {}

    entered_adresses = [start_coordinates, end_coordinates] 
    
    entered_adresses.each do |entered_coordinates|

      distances = [] # this is an array of station objects that include distance from entered address

      all_stations = Citibikenyc.branches["results"]
      

      all_stations.each do |station| #should I load this table in somewhere to limit API hits?

        station_coordinates = []
        station_coordinates << (station['latitude'])
        station_coordinates << (station['longitude'])
        
        distance = Geocoder::Calculations.distance_between(entered_coordinates, station_coordinates)

        # this is where the station object is created
        station_info = { 
          :station_id => (station['id']), 
          :label => (station['label']), 
          :latitude => (station['latitude']),
          :longitude => (station['longitude']),
          :distance => distance 
        }

        distances << station_info # this enters station objects with distance into the distances array

        # (maybe pull out the top five so that if the station has no bikes it can move to the next one in the list...)
        # also need to check with "Citibikenyc.stations_status['results']" to ensure that station is active and currently has available bikes
        # if station is inactive don't display it
        # if station has no bikes display station and bike count and then "Next Closest Staion" and bike count

      end

      nearest_station = distances.min_by { |station| station[:distance] }

      if i == 0
        bike_stations[:start] = nearest_station 
      elsif i == 1
        bike_stations[:end] = nearest_station 
      end

      i += 1

    end

    # all_stations_status = Citibikenyc.stations_status["results"]

    trip_hash = {
      :start_station_id => bike_stations[:start][:station_id],
      :start_station_label => bike_stations[:start][:label],
      :start_station_latitude => bike_stations[:start][:latitude],
      :start_station_longitude => bike_stations[:start][:longitude],
      :end_station_id => bike_stations[:end][:station_id],
      :end_station_label => bike_stations[:end][:label],
      :end_station_latitude => bike_stations[:end][:latitude],
      :end_station_longitude => bike_stations[:end][:longitude],
      :start_address => start_address,
      :start_lat => start_coordinates[0],
      :start_long => start_coordinates[1],
      :end_address => end_address,
      :end_lat => end_coordinates[0],
      :end_long => end_coordinates[1]
    }

    binding.pry

    Trip.new(trip_hash)
    
  end


end




# Citibikenyc.stations_status
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







