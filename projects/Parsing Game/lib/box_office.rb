require 'csv'
require "date"

def most_successful(number, max_year, file_path)
  complete_list = []
  CSV.foreach(file_path) { |row| complete_list << { name: row[0], year: row[1].to_i, earnings: row[2].to_i } }
  movies_before_year = []
  complete_list.each_with_index do |_num, index|
    movies_before_year << complete_list[index] if complete_list[index][:year] < max_year
  end
  sorted = movies_before_year.sort { |a, b| b[:earnings] <=> a[:earnings] }
  sorted.first(number)
end
