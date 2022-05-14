# Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (like the title of this question).
# Spaces will be included only when more than one word is present.

def spin_words(sentece)
  array = sentece.split(" ")
  array.each do |word|
    if word.length >= 5 && word.include?(",") == false
      word.reverse!
    end
  end
  return array.join(" ")
end

puts spin_words("Hey fellow Le Wagon alumni") # => "Hey wollef Le nogaW inmula"

puts spin_words("Rake it until you make it") # => "Rake it litnu you make it"

puts spin_words("Change your life, learn to code") # => "egnahC your life, nrael to code"
