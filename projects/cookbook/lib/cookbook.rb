require_relative 'recipe'
require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv_into_memory
  end

  def add_recipe(recipe)
    @recipes << recipe
    update
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update
  end

  def all
    return @recipes
  end

  def mark_recipe(index)
    recipe = @recipes[index]
    recipe.done? ? recipe.mark_as_false! : recipe.mark_as_done!
    update
  end

  private

  def update
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["name", "description", "rating", "prep_time", "done"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end

  def load_csv_into_memory
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row)
    end
  end
end
