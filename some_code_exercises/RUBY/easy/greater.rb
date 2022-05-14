array = [17, 7, 3, 6, 10, 1]
i = 0
def count(array, i)
  array.each do |number|
    i += 1 if number > 5
  end
  puts i
end

# count(array, i )

def fibonacci
  sequence = []

  sequence += [0, 1] if sequence.empty?
  while sequence.last < 55
    sequence << sequence[-1] + sequence[-2]
  end

  print sequence
end

fibonacci
