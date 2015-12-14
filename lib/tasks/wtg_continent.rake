# Use this file to save data by city. Remember to change continent / city name on line 8 and line 57.
desc "destination data from worldtravelguide"
task :data_by_continent => :environment do

  require "open-uri"
  require "nokogiri"

  url = "http://www.worldtravelguide.net/asia"
  browser2 = open(url).read
  html_doc2 = Nokogiri::HTML(browser2)

  # regions = html_doc.css('div#block-views-site_wide_displays-block_1 div.col1 > ul > li:not(:first-child) > a')

  # regions.each do | region |
  #   region_name = region.text
  #   region_url =  "http://www.worldtravelguide.net" + region.attr('href')

  #   browser2 = open(region_url).read
  #   html_doc2 = Nokogiri::HTML(browser2)
  cities = html_doc.css('div.tabberlive.tabberStyleTwo > div:nth-child(3).tabberTab > ul > li > a:nth-child(1)')
  cities.each do | city |
    city_name = city.text
    city_url = 'http://www.worldtravelguide.net' + city.attr('href')
    puts city_url
    browser2 = open(city_url).read
    html_doc2 = Nokogiri::HTML(browser2)

    desc1 = html_doc2.css('div#block-block-265 p:first-child')
    desc2 = html_doc2.css('div#block-block-265 p:nth-child(2)')
    photos_link = html_doc2.css('ul > li.expanded.first.menu-top-item.active-trail.full > ul.menu > li:nth-child(4).leaf.menu-child-item > a:nth-child(1)')
    photos_url = 'http://www.worldtravelguide.net' + photos_link.attr('href')

    browser3 = open(photos_url).read
    html_doc3 = Nokogiri::HTML(browser3)

    photo_main = html_doc3.css('img.imagefield-field_hero_image').attr('src')
    #   photo_thumbs = html_doc4.css('li > div > div > a')
    #   photo_thumbs.each do | photo_thumb |
    #     photo_thumbs_url = photo_thumbs.attr('href')
    #     browser5 = open(photo_thumbs_url).read
    #     html_doc5 = Nokogiri::HTML(browser5)

    #     photo_url = html_doc5.css('div.views-field-field-hero-image-fid > div > img').attr('src')

    #   end

    # things_to_see_url = city_url + '/things-to-see'
    #   browser6 = open(things_to_see_url).read
    #   html_doc6 = Nokogiri::HTML(browser6)

    #   attractions_array = html_doc6.css('div > div > div > div.views-field-title > span.field-content').to_s.gsub('<span class="field-content">','').split('</span>')
    #   attractions_array.map { |a| a.squish! }

    params = {
      name: city_name,
      continent: "Asia",
      desc1: desc1,
      desc2: desc2,
      photo_main: photo_main
    }

    place = Place.new(params)
    if place.save
      puts "saved #{place.name}"
    else
      puts place.errors.messages
    end
  end
end
