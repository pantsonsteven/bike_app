# stations = Citibikenyc.branches
# stations["results"].each do |s|
#   Station.create({
#     station_id: s["id"],
#     latitude: s["latitude"],
#     longitude: s["longitude"],
#     label: s["label"]
#     })
# end

1.times do |t|
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

1.times do |i|
  Trip.create(start_station_id: rand(1..300), end_station_id: rand(1..300), user_id: 31, start_address: '10 E 21st, New York', start_lat: 40.9, start_long: -73.6, end_address: "511 47th ave long island city, ny", end_lat: 40.8, end_long: -73.6, start_station_latitude: 40.73, start_station_longitude: -73.52, end_station_latitude: 40.8, end_station_longitude: -73.397, start_station_label: "greg station", end_station_label: "samantha station")
end
