require "open-uri"
require "nokogiri"
require "csv"
require_relative 'cli.rb'

class Scraper

    def self.run
        input = CLI.new.menu
        # Define the URL of the webpage to be scraped
        scraping_url = 'https://www.etsy.com/search?q='+ input

        # Open the webpage and read the HTML content
        html = URI.open("#{scraping_url}").read

        # Parse the HTML using Nokogiri
        nokogiri_doc = Nokogiri::HTML(html)

        # Initialize an empty array to store the scraped data
        final_array = []

        # Search for elements with the class '.v2-listing-card__info h3'
        # and add the text of each element to the final_array
        nokogiri_doc.search(".v2-listing-card__info h3").each do |element|
            element = element.text
            final_array << element
        end

        # Print out each element in the final_array with its index
        final_array.each_with_index do |element, index|
            puts "#{index + 1} - #{element}"
        end

        # Define the filepath for the CSV file
        filepath = "test.csv"

        # Open the CSV file for writing
        CSV.open(filepath, 'wb') do |csv|
            # Add headers to the CSV file
            csv << ['title', 'index']
            # Write the data in the final_array to the CSV file
            final_array.each_with_index do |item, index|
            csv << [item, index]
            end
        end
    end
   
end
  
# puts Scraper.new




    
    