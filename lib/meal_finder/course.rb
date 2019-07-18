require_relative './concerns/memorable.rb'

module MealFinder
  class Course

    include Memorable::InstanceMethods
  
    attr_accessor :name, :url 
  
    @@all = []
    
      def initialize (name = nil, url = nil)
        @name = name 
        @url = url  
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
  
    end 

end 