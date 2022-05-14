require_relative "main"

# INTRODUCTION FOR USER
puts "******** Welcome to Collatz Conjecture Wiki👽********"
# ASK STARTING VALUE TO USER
puts "\nWhat number you want to analyze?🤖"
print '---->'
start_time = Time.now
x_value = gets.chomp.to_i
end_time = Time.now
puts "*****************************************************"

# Defining CSV file path
file_path = 'sorted_sequences.csv'

# Method calling, sending the input form user, and store the return value in variable result of later use
result = search_in_csv(x_value, file_path)

if result == 0
  result = create_record(x_value, file_path)
end

puts "That was awesome, here's the collatz sequence🤠, we needed #{result.length - 1} steps to achieve this solution"
puts "Sequence: #{result}"
puts "*****************************************************"
