class Trip < ActiveRecord::Base
  belongs_to :users

  def nearest(start_coordinates, end_coordinates)

    i = 0

    nearest_stations = {}

    entered_adresses = [start_coordinates, end_coordinates]
    
    entered_adresses.each do |location|

      distances = [] # this is an array of station info including distance from entered address, a "station object"

      Citibikenyc.branches["results"].each do |station|
        
        station_coordinates = []
        station_coordinates << (station['latitude'])
        station_coordinates << (station['longitude'])
        
        distance = Geocoder::Calculations.distance_between(address_coordinates, station_coordinates)

        station_info = { :station_id => (station['id']), :label => (station['label']), :distance => distance }

        distances << station_info

      end

      # need to pull out the hash element with the smallest distance value, call it nearest
      # insert that into nearest_stations array (maybe as start and end??? Would need nearest_stations to be an array)
      # nearest would be a "station object"

      if i = 0
        nearest_stations( :start => nearest )
      elsif i = 1
        nearest_stations( :end => nearest )
      end

      i += 1

    end
  end

end
