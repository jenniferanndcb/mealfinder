require_relative './concerns/memorable.rb'

module MealFinder
  class Course

    include Memorable::InstanceMethods
  
    attr_accessor :name, :url 
  
    @@all = []
    
      def initialize (name = nil, url = nil)
        @name = name 
        @url = url  
        @recipes = []
      end 
     
      def self.list_course_names
        MealFinder::Scraper.scrape_courses
      end 
  
      def self.all 
       @@all
      end 

      def save 
        @@all << self 
      end 
  
      def recipes 
        @recipes 
      end 

      def add_recipe(recipe)
        self.recipes << recipe unless self.recipes.include?(recipe)
        recipe.course = self 
      end 
    end 

end 