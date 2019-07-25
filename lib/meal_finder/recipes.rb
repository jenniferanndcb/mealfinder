require_relative './concerns/memorable.rb'

module MealFinder 
  class Recipes

    include Memorable::InstanceMethods 

    attr_accessor :name, :url, :details

    @@recipe_collection = []


    def initialize (name = nil, url = nil) 
      @name = name 
      @url = url 
      
    end 


    def save
      @@recipe_collection << self
    end 
    
    def self.all 
      @@recipe_collection
    end 
    
    
    
  end
end 