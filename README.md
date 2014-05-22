#peddlr

peddlr helps you plan your Citi Bike trips around New York City.

#Description

Citi Bike is a system of publically available bikes placed at stations throughout New York City. But planning a trip using Citi Bike can be complicated. Where is the closest station? Is it active? Does it have any bikes availabe?

peddlr helps you answer these questions and allows you to plan you trips around the city. Users can plan a trip by entering origin and destination addresses. peddlr then looks up the nearest Citi Bike station with available bikes and provides you with a map to the station. peddlr also directs you to the Citi Bike station nearest your destination. In addition, peddlr allows you to look at past trips you've planned because for some reason you would want to do that. Have bad memories attached to a particular trip? Simply delete it and never think about it again. peddlr allows you to avoid the bad feelings that are sometimes connected to riding bikes in New York city.

#Screenshot

(https://dl.dropboxusercontent.com/u/1361162/Screen%20Shot%202014-05-22%20at%209.12.07%20AMEDT.jpg)

###RESOURCES

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



