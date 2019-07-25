require 'nokogiri'
require 'open-uri'
require 'pry'

module MealFinder 
  class Scraper 

    BASE_URL = "https://www.bbcgoodfood.com" 

    def self.scrape_courses
    puts "************ scraping ***************"
      html = open('https://www.bbcgoodfood.com/search/recipes?query=course')
      doc = Nokogiri::HTML(html)
      
      doc.css('ul#facetapi-facet-search-apinode-index-block-field-bbcgf-course li.leaf').each do |course| 
        
        new_course = Course.new 
        new_course.name = course.css("a :first-child").text.gsub(/Apply|filter/, "").strip
         
        new_course.url = BASE_URL + course.css("a")[0]["href"]
        
        Course.all << new_course
      end  

    end 
    

    def self.scrape_recipes(selected_course) 
    puts "************ scraping ***************"
    doc = Nokogiri::HTML(open(selected_course.url))
    
      doc.css("#search-results h3").each do |recipes| 
        
        new_recipe = Recipes.new
        new_recipe.name = recipes.css("a").text.strip
        new_recipe.url = BASE_URL + recipes.css("a")[0]["href"]
        

        Recipes.all << new_recipe
      end 

    end 


    def self.scrape_recipe_details(selected_recipe)
      puts "************ scraping ***************"
     

      doc = Nokogiri::HTML(open(selected_recipe.url))

      selected_recipe.details = 
      
      selected_recipe.description = doc.css(".recipe-header__description p").text
      selected_recipe.prep_time = doc.css(".recipe-details .recipe-details__text .recipe-details__cooking-time-prep").text
      selected_recipe.cook_time = doc.css(".recipe-details .recipe-details__text .recipe-details__cooking-time-cook").text
      
  

      doc.css(".recipe-content").each do |recipe|
        recipe.css(".ingredients-list li").each do |ingredient|
          ingredients = ingredient.attr("content")
          
          selected_recipe.ingredients_list << ingredients
           
                
        end 

        recipe.css(".method__list li").each do |method|
          method_actions = method.css("p").text 

          selected_recipe.method_list << method_actions 

        

          #binding.pry 

        end
        
      
      end   
      
    end 

  end 

end 