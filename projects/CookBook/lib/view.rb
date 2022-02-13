require_relative 'cookbook'
require 'pry-byebug'

class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[✅]" : "[ ]"
      puts "#{index + 1}. #{recipe.name} #{status} ⏲️ PREP-TIME: #{recipe.prep_time} - ⭐RATING:#{recipe.rating}\n.......#{recipe.description}"
    end
  end

  def ask_for(string)
    puts "Please give ⏲️ PREP TIME in minutes and ⭐RATING from (1-5)"
    puts "What's the #{string}"
    print "> "
    gets.chomp
  end

  def ask_for_index
    puts "What's the number?"
    print "> "
    gets.chomp.to_i - 1
  end

  def display_imported_recipes(results)
    results.each_with_index do |element, index|
      puts "#{index + 1} - #{element.name}"
    end
  end

  # def ask_for_import
  #   puts "What ingredient would you like a recipe for?"
  #   ingredient = gets.chomp
  #   puts "Looking for #{ingredient} recipes on the Internet..."
  #   return ingredient
  # end


  #   puts "Which recipe would you like to import? (enter index)"
  #   word_to_import = gets.chomp.to_i - 1
  #   puts "Importing #{first_5_recipes[word_to_import]}..."
  #   return word_to_import
  # end
end
