# Define array of numbers from 1 to max number
# Map to optain sum_of_squares variable
# Sum numbers in array and sqaure it, to obtain square of the sum
# Return square_of_the_sum - sum_of_squares

def sum(max_number)
  array = Array(1..max_number)

  sum_of_squares = array.map { |x| x**2 }

  square_of_the_sum = array.sum

  puts (square_of_the_sum **= 2) - sum_of_squares.sum
end

sum(10)
