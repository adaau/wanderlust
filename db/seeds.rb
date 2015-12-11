# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.destroy_all

  places = Place.create([
    {name: "Tokyo",
    country: "Japan",
    },
    {name: "Sydney",
    country: "Australia",
    },
    {name: "Seoul",
    country: "Korea",
    },
    {name: "London",
    country: "United Kingdom",
    },
    {name: "Venice",
    country: "Italy",
    },
    {name: "New York",
    country: "USA",
    },
    {name: "San Francisco",
    country: "USA",
    },
    {name: "Vancouver",
    country: "Canada",
    },
    {name: "Singapore",
    country: "Singapore",
    },
    {name: "Shanghai",
    country: "China",
    }
  ])

Month.destroy_all

months = Month.create([{name: "January"}, {name: "February"}, {name: "March"}, {name: "April"}, {name: "May"}, {name: "June"}, {name: "July"}, {name: "August"}, {name: "September"}, {name: "October"}, {name: "November"}, {name: "December"}])