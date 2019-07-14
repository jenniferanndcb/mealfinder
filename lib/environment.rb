
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'uri'

require_relative "./meal_finder/recipes"
require_relative "./meal_finder/cli"
require_relative "./meal_finder/course"
require_relative "./meal_finder/scraper"
require_relative "./meal_finder/version"
require_relative "./meal_finder/concerns/memorable"


module CLIProject
  class Error < StandardError; end
  # Your code goes here...
end
