desc "destination data of cities from worldtravelguide"
task :wtg_cities => :environment do

  require "open-uri"
  require "nokogiri"

  url = "http://www.worldtravelguide.net/cities"
  browser = open(url).read
  html_doc = Nokogiri::HTML(browser)

  cities = html_doc.css('div > div.tabberTab > ul > li > a')
  # cities = html_doc.css('div > div.tabberTab > ul:nth-child(4) > li:nth-child(n+79) > a:nth-child(1)')
  cities.each do | city |
    city_name = city.text
    city_url = "http://www.worldtravelguide.net" + city.attr('href')

    browser2 = open(city_url).read
    html_doc2 = Nokogiri::HTML(browser2)

    desc1 = html_doc2.css('div#block-block-265 p:first-child').text
    desc2 = html_doc2.css('div#block-block-265 p:nth-child(2)').text
    desc3 = html_doc2.css('div#block-block-265 p:nth-child(3)').text

    photos_link = html_doc2.css('ul > li.expanded.first.menu-top-item.active-trail.full > ul.menu > li:nth-child(4).leaf.menu-child-item > a:nth-child(1)')
    photos_url = 'http://www.worldtravelguide.net' + photos_link.attr('href')

    browser3 = open(photos_url).read
    html_doc3 = Nokogiri::HTML(browser3)

    if html_doc3.css('img.imagefield-field_hero_image')
      photo_main = html_doc3.css('img.imagefield-field_hero_image').attr('src')
    end

    weather_link = html_doc2.css('ul > li.expanded.first.menu-top-item.active-trail.full > ul.menu > li:nth-child(3).leaf.menu-child-item > a:nth-child(1)')
    weather_url = 'http://www.worldtravelguide.net' + weather_link.attr('href')
    browser4 = open(weather_url).read
    html_doc4 = Nokogiri::HTML(browser4)

    best_time = html_doc4.css('div > div > div > div.field-item.odd > p').text

    params = {
      name: city_name,
      desc1: desc1,
      desc2: desc2,
      desc3: desc3,
      photo_main: photo_main,
      best_time: best_time
    }

    place = Place.find_or_create_by(name: params[:name])
    category_name = "city"
    category_id = Category.find_by(name: category_name)
    place.categories << category_id

    place = Place.new(params)
    if place.save
      puts "saved #{place.name}"
    else
      puts place.errors.messages
    end

  end
end
