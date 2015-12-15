json.extract! @place, :id, :name, :country, :continent, :photo_main, :desc1, :desc2, :desc3, :avg_temps, :avg_precips, :best_time

json.months @place.months.pluck(:name).join(', ')
json.categories @place.categories.pluck(:name).join(', ')
