require "open-uri"
require "nokogiri"
require_relative "recipe"

class ScrapeAllRecipesService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@ingredient}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
    results = []
    doc.search(".card__recipe").first(5).each do |element|
      name = element.at('h3').text.strip
      description = element.search('.card__summary').text.strip
      rating = element.search('.ratings-count').text.strip
      # prep_time = element.search('.recipe-card__duration__value').text.strip
      results << Recipe.new(name: name, description: description, rating: rating)
    end
    return results
  end
end
