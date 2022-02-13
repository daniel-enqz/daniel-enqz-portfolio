require 'csv'
class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    load_csv if File.exist?(@csv_path)
  end

  def all
    return @elements
  end

  def correct_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end

  def create(model)
    model.id = correct_id
    @elements << model
    save_to_csv
  end

  def find(id)
    @elements.find { |model| model.id == id }
  end

  def remove(index)
    @elements.delete_at(index)
    save_to_csv
  end

  def edit(index)
    return @elements[index]
  end
end
