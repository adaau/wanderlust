json.array! @places do |place|
  json.id           place.id
  json.name         place.name
  json.country      place.country
  json.continent    place.continent
  json.photo_main   place.photo_main
  json.desc1        place.desc1
  json.desc2        place.desc2
  json.desc3        place.desc3
  json.avg_temps    place.avg_temps
  json.avg_precips  place.avg_precips
  json.months       place.month_names
  # review-denis | change categories
  json.categories   place.categories.select(:id, :name)
end