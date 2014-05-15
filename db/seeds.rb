stations = Citibikenyc.branches
stations["results"].each do |s|
  Station.create({
    station_id: s["id"],
    latitude: s["latitude"],
    longitude: s["longitude"],
    label: s["label"]
    })
end
