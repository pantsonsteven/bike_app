class Trip < ActiveRecord::Base
  belongs_to :user

  def self.nearest(start_coordinates, end_coordinates)

    # this method needs to return two (maybe more?) station objects, the one closest to the start address and the once closest to the end address

    i = 0

    nearest_stations = {}

    entered_adresses = [start_coordinates, end_coordinates] # need to pull this from params
    
    entered_adresses.each do |entered_coordinates|

      distances = [] # this is an array of station objects that included distance from entered address

      Citibikenyc.branches["results"].each do |station|
        
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

        distances << station_info # this enters station objects with distance into the distnaces array

      end

      # need code here to pull out the station object from distances with the smallest distance value, call it "nearest" 
      # (maybe pull out the top five so that if the station has no bikes it can move to the next one in the list...)
      # insert that into "nearest_stations" array (maybe as start and end??? Would need "nearest_stations" to be an array)
      # nearest would be a "station object"
      # on first iteration of "entered_coordinates", "nearest" would be entered with a ":start" key, second time with an ":end" key
      # also need to check with "Citibikenyc.stations_status['results']" to ensure that station is active and currently has available bikes
      # if station is inactive don't display it
      # if station has no bikes display station and bike count and then "Next Closest Staion" and bike count

      if i == 0
        nearest_stations( :start => nearest )
      elsif i == 1
        nearest_stations( :end => nearest )
      end

      i += 1

    end

  end

end
