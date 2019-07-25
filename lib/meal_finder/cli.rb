require 'pry'

module MealFinder 
  class CLI

    def start
      puts "           -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-"
      puts "          |                                             |"
      puts "          |  Hello and welcome to the Meal Finder CLI.  |"
      puts "          |                                             |"
      puts "           -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-"
      menu
    end 
  
    def menu 
      puts "\t If you are looking for inspirations for your next meal then you've come to the right place.
      \t To see what courses we have available, simply type 'list courses'
      \t To exit the program, simply type 'exit'"

    menu_user_input 

    end 
    
    
    def menu_user_input
      input = gets.chomp 

      if input.downcase == "list courses"
        MealFinder::Scraper.scrape_courses if MealFinder::Course.all.size == 0 
        list_courses
      elsif input.downcase == "exit"
        goodbye 
      else 
        puts "\t Sorry I did not recognise that..."
        
        menu

      end 
    end 
    
    def list_courses
          
      puts "\t 
      \t Here are the courses that we have available.
      \t To choose a course, type in the corresponding number below to get a list of recipe suggestions. 
     
      \t Or simply type 'exit' to exit the program
      
      \t"
        
      puts MealFinder::Course.all.map.with_index {|meal,index|
          "\t#{index+1}. #{meal.name}"}
 
      select_course

    end 
 
    def select_course
      
    input = gets.chomp

      if input.downcase == "exit"
        goodbye

      elsif input.to_i > 0 && input.to_i <= MealFinder::Course.all.size
          selected_course = MealFinder::Course.all[input.to_i-1]

          puts "\t Great! Here are some ideas for you to make for #{selected_course.name}. Please type in the number of the dish you would like to 
          \t find out more about or simply type in 'list courses' to go back to the main menu and choose a different course\t" 
      
          MealFinder::Scraper.scrape_recipes(selected_course) if MealFinder::Recipes.all.size == 0  
          list_recipes

      else 
        puts "\t Sorry, I did not recognise that..."

        list_courses

      end 
        
    
             
    end 

    def list_recipes
      
  
      puts MealFinder::Recipes.all.map.with_index {|recipe, i| 
        "#{i+1}. #{recipe.name}"}
      
      

      select_recipe

    end 
    

    def select_recipe
    
    input = gets.chomp.downcase 

      
    if input == "list courses"
      list_courses

      elsif input == "exit"
        goodbye
      
      elsif input.to_i > 0 && input.to_i <= MealFinder::Recipes.all.size
          selected_recipe = MealFinder::Recipes.all[input.to_i-1]
        
      recipe_details(selected_recipe)

      
      else 
        puts "\t Sorry, I did not recognise that.
        \t Please type in the number of the dish that you are looking for 
        \t or 'list courses' to see the courses again or 'exit' to exit the program"
      select_recipe
      end 
    end 
    
    def recipe_details(selected_recipe)
      MealFinder::Scraper.scrape_recipe_details(selected_recipe) unless selected_recipe.details 
       
      recipe_details_content(selected_recipe) 
      
      recipe_next_steps
       
      
    end 
    
    def recipe_details_content(selected_recipe)
#binding.pry
      deets = selected_recipe.details 

      puts "\t"
      puts "Here is the recipe for #{selected_recipe.name}\n\t" 
      
      puts "#{deets[:description]}\n\t"
      puts "#{deets[:prep_time]}"
      puts "#{deets[:cook_time]}\n\t"
    
      puts "Ingredients:\n\t"
      puts deets[:ingredients_list].collect {|item| "#{item}"}
      puts "\nMethod:\n\t"
      puts deets[:method_list].each.with_index {|method, index| "#{index+1}. #{method}\n\t"}

    end

      

     

    def recipe_next_steps

      puts "\t Not quite what you are looking for? 
      \t Type 'list recipes' to go back to list of recipes from the same Course and choose a different dish\n\t
      \t To go back to the main menu, simply type 'list courses'
      \t To exit the program, type 'exit'"

      input = gets.chomp 

      if input.downcase == "list recipes"
  
        puts MealFinder::Recipes.all.map.with_index {|recipe, i| 
          "#{i+1}. #{recipe.name}"}
        
        select_recipe

      elsif input.downcase == "list courses"
        list_courses 
 
      elsif input.downcase == "exit"
        goodbye

      else 
        puts "\t Sorry I did not recognise that...
        \t Type 'list recipes' to go back to list of recipes from the same Course and choose a different dish\n\t
        \t To go back to the main menu, simply type 'list courses'
        \t To exit the program, type 'exit'"
      
      recipe_next_steps
      
      end 
    end 
  
  def goodbye 
    puts "\t Thank you for using the Meal Finder CLI. See you next time!"
    exit 
  end 

  
  end 

end 