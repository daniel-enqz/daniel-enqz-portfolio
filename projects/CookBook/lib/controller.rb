require_relative "view"
require_relative "recipe"
require_relative "scrape_allrecipes_service"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view     = View.new
  end

  def list
    display_recipes
  end

  def create
    name = @view.ask_for("name")
    description = @view.ask_for("description")
    rating = @view.ask_for("rating").to_i
    prep_time = @view.ask_for("prep time").to_i
    new_recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(new_recipe)
    display_recipes
  end

  def destroy
    display_recipes
    recipe_index = @view.ask_for_index
    @cookbook.remove_recipe(recipe_index)
    display_recipes
  end

  def import
    term = @view.ask_for("search")
    results = ScrapeAllRecipesService.new(term).call
    @view.display_imported_recipes(results)
    index = @view.ask_for_index
    @cookbook.add_recipe(results[index])
    display_recipes
  end

  def mark
    display_recipes
    index = @view.ask_for_index
    @cookbook.mark_recipe(index)
    display_recipes
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
