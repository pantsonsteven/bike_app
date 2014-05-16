# stations = Citibikenyc.branches
# stations["results"].each do |s|
#   Station.create({
#     station_id: s["id"],
#     latitude: s["latitude"],
#     longitude: s["longitude"],
#     label: s["label"]
#     })
# end

# 10.times do |t|
#   User.create(name: Faker::Name.name, email: Faker::Internet.email)
# end

10.times do |i|
  Trip.create(start_station: rand(1..300), end_station: rand(1..300), user_id: rand(1..10), start_location: rand(1..10), end_location: rand(1..10))
end
