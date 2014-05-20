##CHANGE LOG

#### 5/15/14

* created rails app for bikes
* got gems for geocoder and citibikesnyc
* set up routes, controllers, models and views for CRUD app
* set up migrations 
* seeded STATIONS table from Citibikenyc.branches method, now populated with data on all Citi Bike stations throughout the city

####5/16/14

* changed database structure; added separate table for locations to jib with Geocoder gem
* changed db structure back to original, dropped locations table, figured out how to use geocoder methods etc.
* worked on logic for calculating distance between entered address and nearest Citi Bike stations
* added method "nearest" in trip model

####5/17/14

* add radio button to address form for current location
* added columns to trips table
* reformatted new form for trips

####5/19/14

* added user and authorization functionality
* got trip form working so that new trips can be created
* worked on trips#show and trips#index pages
* got user authorization working

####5/20/14

* got app working on heroku - thawing-atoll-1044.herokuapp.com
* got IP address location working






