require 'nokogiri'
require 'open-uri'
require 'pry'

module MealFinder 
  class Scraper 

    BASE_URL = "https://www.bbcgoodfood.com" 

    def self.scrape_courses
      html = open('https://www.bbcgoodfood.com/search/recipes?query=course')
      doc = Nokogiri::HTML(html)
      
      doc.css('ul#facetapi-facet-search-apinode-index-block-field-bbcgf-course li.leaf').each do |course| 
        
        new_course = Course.new 
        new_course.name = course.css("a :first-child").text.gsub(/Apply|filter/, "").strip
         
        new_course.url = BASE_URL + course.css("a")[0]["href"]
        
      end  

    end 
    

    def self.scrape_recipes(selected_course) 

    doc = Nokogiri::HTML(open(selected_course.url))
    
      doc.css("#search-results h3").each do |recipes| 
        
        new_recipe = Recipes.new
        new_recipe.name = recipes.css("a").text.strip
        new_recipe.url = BASE_URL + recipes.css("a")[0]["href"]
      
      end 

    end 


    def self.scrape_recipe_details(selected_recipe)
      ingredients_list = []
      method_list = []

      doc = Nokogiri::HTML(open(selected_recipe.url))

      puts "\t"
      puts "Here is the recipe for #{selected_recipe.name}\n\t"
      puts "#{doc.css(".recipe-header__description p").text}\n\t"
      puts "#{doc.css(".recipe-details .recipe-details__text .recipe-details__cooking-time-prep").text}"
      puts "#{doc.css(".recipe-details .recipe-details__text .recipe-details__cooking-time-cook").text}\n\t"
      

      doc.css(".recipe-content").each do |recipe|
        recipe.css(".ingredients-list li").each do |ingredient|
          ingredients = ingredient.attr("content")
          
          ingredients_list << ingredients
         
        end 
        recipe.css(".method__list li").each do |method|
          method_actions = method.css("p").text 

          method_list << method_actions

        end
        
        puts "Ingredients:\n\t"
        puts ingredients_list.collect {|item| "#{item}"}
        puts "\nMethod:\n\t"
        puts method_list.map.with_index {|method, index| "#{index+1}. #{method}\n\t"}
      
      end   

    end 

  end 

end 