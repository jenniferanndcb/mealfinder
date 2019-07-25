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
      
  
      def self.all 
       @@all
      end 

      def save 
        @@all << self 
      end 
  
      def recipes 
        @recipes 
      end 

    end 

end 