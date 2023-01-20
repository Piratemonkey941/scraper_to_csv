# frozen_string_literal: true

require_relative "scrape_to_csv/version"

require_relative "cli.rb"
require_relative "scraping.rb"
require_relative "user.rb"
require_relative "auth.rb"

module ScrapeToCsv
  class Error < StandardError; end
  # Your code goes here...
end
