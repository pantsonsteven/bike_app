class Trip < ActiveRecord::Base
  belongs_to :users

  def nearest(start_coordinates, end_coordinates)

    i = 0

    nearest_stations = {}

    entered_adresses = [start_coordinates, end_coordinates]
    
    entered_adresses.each do |entered_coordinates|

      distances = [] # this is an array of station info including distance from entered address, a "station object"

      Citibikenyc.branches["results"].each do |station|
        
        station_coordinates = []
        station_coordinates << (station['latitude'])
        station_coordinates << (station['longitude'])
        
        distance = Geocoder::Calculations.distance_between(entered_coordinates, station_coordinates)

        station_info = { 
          :station_id => (station['id']), 
          :label => (station['label']), 
          :distance => distance 
        }

        distances << station_info # this enteres station objects with distance into the distnaces array

      end

      # need to pull out the hash element from distances with the smallest distance value, call it nearest
      # insert that into nearest_stations array (maybe as start and end??? Would need nearest_stations to be an array)
      # nearest would be a "station object"
      # on first iteration of entered_coordinates, nearest would be entered with a :start key, second time with an :end key

      if i = 0
        nearest_stations( :start => nearest )
      elsif i = 1
        nearest_stations( :end => nearest )
      end

      i += 1

    end
  end

end
