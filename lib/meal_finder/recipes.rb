require_relative './concerns/memorable.rb'

module MealFinder 
  class Recipes

    include Memorable::InstanceMethods 

    attr_accessor :name, :url, :course, :details, :cook_time, :prep_time, :description, :ingredients_list, :method_list

    @@recipe_collection = []


    def initialize (name = nil, url = nil) 
      @name = name 
      @url = url 
      @course = course
      @details = details
      @cook_time = cook_time
      @prep_time = prep_time
      @ingredients_list = []
      @method_list = []

    end 

    
    def course=(course)
     @course = course
     binding.pry
      course.add_recipe(self)
    end 

    def save
      @@recipe_collection << self
    end 
    
    def self.all 
      @@recipe_collection
    end 
    
    
    
  end
end 