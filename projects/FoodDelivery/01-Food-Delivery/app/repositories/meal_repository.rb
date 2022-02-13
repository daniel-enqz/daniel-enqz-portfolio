require_relative '../models/meal'
require_relative 'base_repository'
require 'csv'
require 'pry-byebug'

class MealRepository < BaseRepository
  private

  def save_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "name", "price"]
      @elements.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(id: row[:id], name: row[:name], price: row[:price])
    end
  end
end
