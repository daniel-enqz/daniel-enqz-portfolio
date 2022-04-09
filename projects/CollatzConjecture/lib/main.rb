# Define some libraries
require 'csv'
require 'json'

# We define our class, we will create a new instance of Collatz Conjecture,
# I chose this approach, because we can add possible methods to it.
class CollatzConjecture
  def initialize(starting_value)
    @starting_value = starting_value
  end

  # Method to get the actual sequence
  def sequence
    array = [@starting_value]
    i = 0
    while array.last != 1
      (array[i] % 2).zero? ? array << array[i] / 2 : array << (array[i] * 3) + 1
      i += 1
    end
    array
  end

  # Method to get the number of steps tp achieve 1
  def steps
    sequence.length - 1
  end
end

# First, we will iterate over our infinite memory csv 🤫 to see if we can find an allready stored sequence for x_value
def search_in_csv(x_value, file_path)
  # If we can find the sequence, we will parse it using JSON and return it
  CSV.foreach(file_path) { |row| return JSON.parse(row[1]) if row[0] == x_value.to_s }
  # If no  sequence is found, we will return 0
  0
end

def create_record(x_value, file_path)
  # Stores a new Collatz Conjecture sequence
  # Starting Value, the steps and sequence itself are being stored for later use.
  result = CollatzConjecture.new(x_value)
  CSV.open(file_path, 'ab') do |csv|
    csv << [x_value, result.sequence, result.steps]
  end
  result
end
