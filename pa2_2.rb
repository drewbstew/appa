# Given an array of words, remove all the occurrences of the letter 'a' in those words and return the resulting array.
def remove_letter_a(words)
  result = []
  word = []
  words.each do |word|
    new_word = []
    x.split('').each do |y|
      new_word << y if y.to_s.downcase != "a"
    end
    new_word = new_word.join('')
    result << new_word
  end
  result
end

# An abundant number is less than the sum of its divisors, not including itself. 12's divisors are 1, 2, 3, 4, 6, which sum to 16. xw16 > 12 so 12 is an abundant number.
# Write a method that, given a number, returns a boolean indicating whether that number is abundant.
def abundant?(num) 
  halfway = num / 2 + 1
  i = 1
  divisors = []
  until i >= halfway
    divisors << i if num % i == 0
    i += 1
  end
  num < divisors.reduce(:+)
end

# Return the greatest number that's a factor of both inputs.
# greatest_common_factor(6, 10) => 2
# greatest_common_factor(10, 15) => 5
def greatest_common_factor(first_number, second_number)
  factors1 = find_factors(first_number)
  factors2 = find_factors(second_number)
  shared = []
  factors1.each {|x| shared << x if factors2.include? x}
  shared.max
end

def find_factors(num)
  halfway = num / 2 + 1
  i = 1
  factors = []
  until i >= halfway
    factors << i if num % i == 0
    i += 1
  end
  factors
end

# Write a method that, given a sentence without punctuation or capitalization, returns the word with the greatest number of repeated letters. Return the first word if there's a tie. It doesn't matter how often individual letters repeat, just that they repeat.
# word_with_most_repeats("I took the road less traveled and that has made all the difference") => "difference" because "difference" has two repeated letters, more than the other words.
def word_with_most_repeats(sentence)
  most_repeats = ""
  sentence.split(' ').each do |word|
    check = Hash.new(0)
    word.split('').each {|x| check[x] += 1}
    most_repeats = word if check.select {|y| check[y] >= 2}.length > most_repeats.length
  end
  most_repeats
end

require_relative 'test.rb'