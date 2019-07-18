require_relative './concerns/memorable.rb'

module MealFinder 
  class Recipes

    include Memorable::InstanceMethods 

    attr_accessor :name, :url

    @@recipe_collection = []


    def initialize (name = nil, url = nil, details = nil)
      @name = name 
      @url = url 
      @details = details
    end 


    #def self.list_recipe_names(selected_course)
      #MealFinder::Scraper.scrape_recipes(selected_course)
    #end
  
    #def self.recipe_details(selected_recipe)
     # MealFinder::Scraper.scrape_recipe_details(selected_recipe)
    #end 
    
    def self.all 
      @@recipe_collection
    end 
     
  end
end 