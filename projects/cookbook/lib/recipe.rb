class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating].to_i
    @prep_time = attributes[:prep_time].to_i
    @done = attributes[:done] || false
  end

  def mark_as_done!
    @done = true
  end

  def mark_as_false!
    @done = false
  end

  def done?
    @done
  end
end
