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
        end
    end

    # Now you can create an instance of the class
    scraper = Scraper.new
    
    #and call the scraping method on the instance
    # scraper.scraping("https://www.etsy.com/search?q=#{input}")

    filepath = "test.csv"

    csv_options = {headers: :first_row, col_sep: ','}

    # CSV.open(filepath, 'wb') do |csv|
    #     csv << ['title', 'index']
    #     @final_array.each_with_index do |item, index|
    #         csv << [item, index]
    #     end
    # end



# require "open-uri"
# require "nokogiri"
# require "csv"
# require_relative 'cli.rb'

# class Scraper
#     def initialize
#         @input = CLI.new.menu
#       end

#     def scraping(url)
#         html = URI.open("#{url}").read
#         nokogiri_doc = Nokogiri::HTML(html)
#         final_array = []

#         nokogiri_doc.search(".v2-listing-card__info h3").each do |element|
#             element = element.text
#             final_array << element
#         end

#         final_array.each_with_index do |element, index|
#             puts "#{index + 1} - #{element}"
#         end
#     end

   
#     scraping = scraping('https://www.etsy.com/search?q=marvel')


#     filepath = "test.csv"

#     csv_options = {headers: :first_row, col_sep: ','}

#     CSV.open(filepath, 'wb') do |csv|
#         csv << ['title', 'index']
#         scraping.each_with_index do |item, index|
#             csv << [item, index]
#         end
#     end
# end

#     def self.run
#         input = CLI.new.menu
#         # Define the URL of the webpage to be scraped
#         scraping_url = 'https://www.etsy.com/search?q='+ input

#         # Open the webpage and read the HTML content
#         html = URI.open("#{scraping_url}").read

#         # Parse the HTML using Nokogiri
#         nokogiri_doc = Nokogiri::HTML(html)

#         # Initialize an empty array to store the scraped data
#         final_array = []

#         # Search for elements with the class '.v2-listing-card__info h3'
#         # and add the text of each element to the final_array
#         nokogiri_doc.search(".v2-listing-card__info h3").each do |element|
#             element = element.text
#             final_array << element
#         end

#         # Print out each element in the final_array with its index
#         final_array.each_with_index do |element, index|
#             puts "#{index + 1} - #{element}"
#         end

#         # Define the filepath for the CSV file
#         filepath = "test.csv"

#         # csv_options = {headers: :first_row, col_sep: ','}
#         # CSV.default_options = {headers: :first_row, col_sep: ','}

#         # Open the CSV file for writing
#         CSV.open(filepath, 'w', {headers: :first_row, col_sep: ','}) do |csv|
#             # Add headers to the CSV file
#             csv << ['title', 'index']
#             # Write the data in the final_array to the CSV file
#             final_array.each_with_index do |item, index|
#             csv << [item, index]
#             end
#         end
#     end
#     rescue Exception => e
#     puts e
#     end
#   end
  





    
    