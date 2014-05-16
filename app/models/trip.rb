class Trip < ActiveRecord::Base
  belongs_to :users

  def self.search(some_place)
        place = API.find(some_place)
    lat, long = Geocode.find(place).lat, Geocode.find(place).lng
    GooglePlaces.find(lat, long, type: 'restuarant')
  end
end
