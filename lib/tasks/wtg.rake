desc "destination data from worldtravelguide"
task :dest_data => :environment do

  require "open-uri"
  require "nokogiri"

  url = "http://www.worldtravelguide.net/destinations"

  # begin
    browser = open(url).read
  # rescue OpenURI::HTTPError => http_error
  #     # bad status code returned
  #     status = http_error.io.status[0].to_i # => 3xx, 4xx, or 5xx
  #     puts "Got a bad status code #{status}"
  #     # http_error.message is the numeric code and text in a string
  # end

  html_doc = Nokogiri::HTML(browser)

  regions = html_doc.css('div#block-views-site_wide_displays-block_1 div.col1 > ul > li:not(:first-child) > a')

  regions.each do | region |
    region_name = region.text
    region_url =  "http://www.worldtravelguide.net" + region.attr('href')

    browser2 = open(region_url).read
    html_doc2 = Nokogiri::HTML(browser2)

    cities = html_doc2.css('div#block-block-252 > div > div > div:nth-child(2) > ul > li > a')

    cities.each do | city |
      city_name = city.text

      city_url = 'http://www.worldtravelguide.net' + city.attr('href')
      browser3 = open(city_url).read
      html_doc3 = Nokogiri::HTML(browser3)

      desc1 = html_doc3.css('div#block-block-265 p:first-child')
      desc2 = html_doc3.css('div#block-block-265 p:nth-child(2)')

      photos_url = city_url + '/pictures'
        browser4 = open(photos_url).read
        html_doc4 = Nokogiri::HTML(browser4)

        photo_main = html_doc4.css('img.imagefield-field_hero_image').attr('src')

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
        continent: region_name,
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

end
