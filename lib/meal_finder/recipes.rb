require_relative './concerns/memorable.rb'

module MealFinder 
  class Recipes

    include Memorable::InstanceMethods 

    attr_accessor :name, :url, :details, :cook_time, :prep_time, :description, :ingredients_list, :method_list

    @@recipe_collection = []


    def initialize (name = nil, url = nil) 
      @name = name 
      @url = url 
      @details = details
      @cook_time = cook_time
      @prep_time = prep_time
      @ingredients_list = []
      @method_list = []

    end 

    def self.create_recipe_list (selected_course)
      MealFinder::Scraper.scrape_recipes(selected_course)
    end 

    def self.find_recipe_list (selected_course)
      self.all.detect{|recipes| recipes.name }
    end 

    def self.find_or_create_recipe_list (selected_course)
      self.find_recipe_list(selected_course) || self.create_recipe_list(selected_course)
    end 

    

#    def self.create_recipe(selected_recipe)
#      MealFinder::Scraper.scrape_recipe_details(selected_recipe) 
#    end 

#    def self.find_recipe(selected_recipe)
#      self.all.detect {|recipes|recipes.url}
#    end 

#    def self.find_or_create_recipe(selected_recipe)
#      self.find_recipe(selected_recipe) || self.create_recipe(selected_recipe)
#    end 

    def save
      @@recipe_collection << self
    end 
    
    def self.all 
      @@recipe_collection
    end 
    
    
    
  end
end 