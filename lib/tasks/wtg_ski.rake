desc "destination data of cities from worldtravelguide"
task :wtg_ski => :environment do

  require "open-uri"
  require "nokogiri"

  url = "http://www.worldtravelguide.net/ski"
  browser = open(url).read
  html_doc = Nokogiri::HTML(browser)

  cities = html_doc.css('div > div.tabberTab > ul > li > a')
  cities.each do | city |
    city_name = city.text
    city_url = "http://www.worldtravelguide.net" + city.attr('href')

    puts city_name

    browser2 = open(city_url).read
    html_doc2 = Nokogiri::HTML(browser2)

    desc1 = html_doc2.css('div.content > div.field.field-type-text.field-field-intro > div.field-items > div.field-item.odd > p:nth-child(1)').text
    desc2 = html_doc2.css('div.content > div.field.field-type-text.field-field-intro > div.field-items > div.field-item.odd > p:nth-child(2)').text
    desc3 = html_doc2.css('div.content > div.field.field-type-text.field-field-intro > div.field-items > div.field-item.odd > p:nth-child(3)').text

    puts desc1
    puts desc2
    puts desc3

    photo_main = html_doc2.css('div > div > div > div > img.redesign-hero').attr('src')
    puts photo_main
    params = {
      name: city_name,
      desc1: desc1,
      desc2: desc2,
      desc3: desc3,
      photo_main: photo_main,
    }

    place = Place.find_or_create_by(name: params[:name])
    place.desc1 = desc1           if place.desc1 == nil
    place.desc2 = desc2           if place.desc2 == nil
    place.desc3 = desc3           if place.desc3 == nil
    place.photo_main = photo_main if place.photo_main == nil

    # place.categories << Category.fourth
    # puts Category.fourth.name

    # place.months << Month.first
    # place.months << Month.second
    # place.months << Month.third
    # place.months << Month.find(12)
    # puts Month.second.name
    # puts Month.find(12).name

    if place.save
      puts "saved #{place.name} || id: #{place.id}"
    else
      puts place.errors.messages
    end

  end
end
