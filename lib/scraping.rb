require "open-uri"
require "nokogiri"
require "csv"
require_relative 'cli.rb'

    class Scraper
        def self.scraping(input)
            # input = CLI.new.menu
            # puts "Start scraping #{url}"
            html = URI.open("https://www.etsy.com/search?q=#{input}").read
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
            csv_generator(input)
        end

        def self.csv_generator(input)

            filepath = "./csv/#{input}.csv"
    
            csv_options = {headers: :first_row, col_sep: ','}
    
            CSV.open(filepath, 'wb') do |csv|
                csv << ['title', 'index']
                @final_array.each_with_index do |item, index|
                    csv << [item, index]
                end
    
            end
        end
    end
