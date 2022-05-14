require_relative "../views/meals_view"
require_relative "../models/meal"
require_relative "base_controller"

class MealsController < BaseController
  def initialize(repository)
    @repository       = repository
    @view             = MealsView.new
  end

  def add
    name = @view.ask_for("meal name?")
    price = @view.ask_for("meal price?").to_i
    new_meal = Meal.new(name: name, price: price)
    @repository.create(new_meal)
    list
  end
end
