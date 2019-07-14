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
        MealFinder::Course.list_course_names
        list_courses
      elsif input.downcase == "exit"
        goodbye 
      else 
        puts "\t Sorry I did not recognise that..."
        
        menu

      end 
    end 
    
    def list_courses
      
      course_arr = MealFinder::Course.all
      
      puts "\t 
      \t Here are the courses that we have available.
      \t To choose a course, type in the corresponding number below to get a list of recipe suggestions. 
     
      \t Or simply type 'exit' to exit the program
      
      \t"
        
      puts course_arr.map.with_index {|meal,index|
          "\t#{index+1}. #{meal.name}"}
 
      select_course(course_arr)

    end 
 
    def select_course(course_arr)
      
    input = gets.chomp

      if input.downcase == "exit"
        goodbye

      elsif input.to_i > 0 && input.to_i < 23
          selected_course = course_arr[input.to_i-1]

          puts "\t Great! Here are some ideas for you to make for #{selected_course.name}. Please type in the number of the dish you would like to 
          \t find out more about or simply type in 'list courses' to go back to the main menu and choose a different course\t" 
        

      else 
        puts "\t Sorry, I did not recognise that..."

        list_courses

      end 
        
    MealFinder::Recipes.list_recipe_names(selected_course)
    list_recipes(selected_course)
             
    end 

    def list_recipes(selected_course)
      recipe_arr = MealFinder::Recipes.all
  
      puts recipe_arr.map.with_index {|recipe, i| 
        "#{i+1}. #{recipe.name}"}

      select_recipe(recipe_arr)

    end 
    

    def select_recipe(recipe_arr)
    
    input = gets.chomp 

      
    if input.downcase == "list courses"
      MealFinder::Recipes.all.clear 
      list_courses

      elsif input.downcase == "exit"
        goodbye
      
      elsif input.to_i > 0 && input.to_i < 16
          selected_recipe = recipe_arr[input.to_i-1]
 
      recipe_details(selected_recipe)
      
      else 
        puts "\t Sorry, I did not recognise that.
        \t Please type in the number of the dish that you are looking for 
        \t or 'list courses' to see the courses again or 'exit' to exit the program"
      select_recipe(recipe_arr)
      end 
    end 
  
  
    def recipe_details(selected_recipe)
      
      MealFinder::Recipes.recipe_details(selected_recipe)

      puts "\t Not quite what you are looking for? 
      \t Type 'list recipes' to go back to list of recipes from the same Course and choose a different dish\n\t
      \t To go back to the main menu, simply type 'list courses'
      \t To exit the program, type 'exit'"
      
      recipe_next_steps

    end 

    def recipe_next_steps
      
      input = gets.chomp 

      if input.downcase == "list recipes"
        recipe_arr = MealFinder::Recipes.all
  
        puts recipe_arr.map.with_index {|recipe, i| 
          "#{i+1}. #{recipe.name}"}
        
        select_recipe(recipe_arr)

      elsif input.downcase == "list courses"
        MealFinder::Recipes.all.clear
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