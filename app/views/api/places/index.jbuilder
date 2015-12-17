json.array! @places do |place|
  json.id           place.id
  json.name         place.name
  json.country      place.country
  json.continent    place.continent
  json.photo_main   place.photo_main
  json.months       place.month_names
  json.categories   place.category_names
end