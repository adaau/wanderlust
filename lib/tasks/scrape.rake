desc "Scraping data for destinations"
task :city_data => :environment do
  require "open-uri"
  require "nokogiri"

  url = "http://www.besttimetogo.com/browse.php"
  browser = open(url).read
  html_doc = Nokogiri::HTML(browser)

  continents = html_doc.css('div#center > div')
  countries_tables = html_doc.css('div#center > table')

  continents.each_with_index do | continent, index |
    continent_name = continent.text
    countries = countries_tables[index].css('tr > td > a')

    countries.each do | country |
      country_name = country.text
      country_url = "http://www.besttimetogo.com/" + country.attr('href')

      browser2 = open(country_url).read
      html_doc2 = Nokogiri::HTML(browser2)

      cities = html_doc2.css('tr > td > a')

      cities.each do | city |
        city_name = city.css('b').text
        city_url = "http://www.besttimetogo.com/" + city.attr('href')

        browser3 = open(city_url).read
        html_doc3 = Nokogiri::HTML(browser3)

        # avg_temps_array = html_doc3.css('div#temp tr:not(:first-child) td:nth-child(2)').text.gsub('F', '').split(' ')
        # avg_precips_array = html_doc3.css('div#temp tr:not(:first-child) td:nth-child(3)').text.gsub('in', '').split(' ')

        best_months_array = html_doc3.css('div.content-main > div.box > p:nth-child(2)').to_s.gsub("</p>", '').split("<br>")
        best_months_array.shift
        best_months_array.map { |a| a.squish! }

        # params = {
        #   name: city_name,
        #   country: country_name,
        #   continent: continent_name,
        #   avg_temps: avg_temps_array,
        #   avg_precips: avg_precips_array,
        # }

        # place = Place.new(params)
        # if place.save
        #   puts "saved #{place.name}"
        # else
        #   puts place.errors.messages
        # end

        best_months_array.each do | month |
          month_id = Month.find_by(name: month).id
          # month_number = Date::MONTHNAMES.index(month)
          puts month_number
        end

        # get all the data for place. [DONE]
        # save the place and retrieve the place_id  Place.pluck(:id)
        # get best months [DONE]
        # for each best_month
          # get the month_id
          # create a new MonthPlace with month_id and place_id

      end
    end
  end

end
