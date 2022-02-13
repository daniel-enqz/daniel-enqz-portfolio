require_relative '../repositories/meal_repository'
require 'pry-byebug'
require_relative 'base_view'

class MealsView < BaseView
  def display(all_meals)
    all_meals.each_with_index do |meal, index|
      puts "- #{index + 1}🍎 #{meal.name} 💸PRICE:#{meal.price}"
    end
  end
end
