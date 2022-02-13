class BaseView
  def ask_for(string)
    puts "What's the #{string}"
    print ">"
    gets.chomp
  end

  def ask_for_index
    puts "What number?"
    print ">"
    gets.chomp.to_i - 1
  end
end
