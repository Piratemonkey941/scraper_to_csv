require "open-uri"
require "nokogiri"
require "csv"
require_relative 'cli.rb'

class Scraper
    input = CLI.new.menu

    def scraping(url)
        puts "Start scraping #{url}"
        html = URI.open("#{url}").read
        nokogiri_doc = Nokogiri::HTML(html)
        @final_array = []
        nokogiri_doc.search(".v2-listing-card__info h3").each do |element|
            element = element.text
            @final_array << element
        end
        puts "Scraping done, final_array size: #{@final_array.size}"
        @final_array.each_with_index do |element, index|
            puts "#{index + 1} - #{element}"
        end
    end

    # Now you can create an instance of the class
    scraper = Scraper.new
    #and call the scraping method on the instance
    scraper.scraping('https://www.etsy.com/search?q=marvel')

    filepath = "test.csv"

    csv_options = {headers: :first_row, col_sep: ','}

    CSV.open(filepath, 'wb') do |csv|
        csv << ['title', 'index']
        @final_array.each_with_index do |item, index|
            csv << [item, index]
        end
    end
end


# 


    
    