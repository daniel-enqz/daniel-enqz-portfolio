require_relative '../models/employee'
require 'csv'
require 'pry-byebug'

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    load_csv if File.exist?(@csv_path)
  end

  def all_riders
    @elements.select { |element| element if element.rider? }
  end

  def find_by_username(username)
    @elements.find { |model| model.username == username }
  end

  def correct_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end


  private

  def save_to_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << ["id", "username", "password", "role"]
      @elements.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(id: row[:id], username: row[:username], password: row[:password], role: row[:role])
    end
  end
end
