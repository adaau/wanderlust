# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Month.destroy_all

# months = Month.create([
#   {name: "January"},
#   {name: "February"},
#   {name: "March"},
#   {name: "April"},
#   {name: "May"},
#   {name: "June"},
#   {name: "July"},
#   {name: "August"},
#   {name: "September"},
#   {name: "October"},
#   {name: "November"},
#   {name: "December"}
# ])

Category.destroy_all

categories = Category.create([
  {name: "beach"},
  {name: "city"},
  {name: "nature"},
  {name: "snow"}
])