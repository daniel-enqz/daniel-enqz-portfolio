class SumOfMultiples
  def initialize(array, multiples)
    @array = array
    @multiples = multiples
  end

  def sum_of_multiples
    first_multiple = @multiples[0]
    second_multiple = @multiples[1]
    sum = 0
    @array.each do |number|
      sum += number if (number % first_multiple).zero? || (number % second_multiple).zero?
    end
    sum
  end

  def power_two
    sum_of_multiples**2
  end
end

array = (1...10).to_a
multiples = [3, 5]
result = SumOfMultiples.new(array, multiples)

puts result.sum_of_multiples
puts result.power_two
