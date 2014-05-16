##RESOURCES

#### Trello

- https://trello.com/b/Q5YkldhD/bike-app

#### Heroku

- http://thawing-atoll-1044.herokuapp.com/

#### Citi Bike System Data

- http://www.citibikenyc.com/system-data

#### Citibikenyc gem

- gets realtime data on Citi Bike stations throughout the city

- https://github.com/edgar/citibikenyc

- Get a list of all stations
-- Citibikenyc.stations

- Get only the current status for all stations
-- Citibikenyc.stations_status

- Get helmets info
-- Citibikenyc.helmets

- Get branches info
-- Citibikenyc.branches

#### Geocoder gem

- http://www.rubygeocoder.com/
- http://rdoc.info/github/alexreisner/geocoder/master/frames

- uses Google Maps API to allow for various forms of spatial analysis, including distance calculations between two location and geocoding street address to lat/long

##### Useful commands for Geocoder

- look up coordinates of some location (like searching Google Maps)

```ruby
Geocoder.coordinates("25 Main St, Cooperstown, NY")
 => [42.700149, -74.922767]
 ```

- distance (in miles) between Eiffel Tower and Empire State Building

```ruby
Geocoder::Calculations.distance_between([47.858205,2.294359], [40.748433,-73.985655])
 => 3619.77359999382
```



