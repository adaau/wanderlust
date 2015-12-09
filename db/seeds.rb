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

Bookmark.destroy_all

  bookmarks = Bookmark.create([
    {list: "January",
    comment: "new year",
    place_id: places.first.id
    },
    {list: "January",
    comment: "summer there",
    place_id: places.second.id
    },
    {list: "February",
    comment: "good eats",
    place_id: places.third.id
    },
    {list: "June",
    comment: "wimbledon",
    place_id: places.fourth.id
    },
    {list: "June",
    comment: "summer holiday",
    place_id: places.fifth.id
    }
  ])