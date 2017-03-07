# Define a method that accepts two arguments, a string and an integer. The method should return a copy of the string with the nth letter removed.
def remove_nth_letter(string, n)
  i = 0
  n = string.size - n.abs if n < 0
  result = ""
  until i >= string.size
    result << string[i] unless i == n
    i += 1
  end
  result
end

# Define a method that chunks an array into a nested array of sub-arrays of length n. The last array may be of length less than n if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]
def chunk(array, n)
  result = []
  i = array.size
  while i > 0
    slice = array[0,2]
    result << slice if slice != nil
    array = array[2..-1]
    i -= 2
  end
  result 
end

# Define a method that multiplies the frequencies of the periods, commas, hyphens, semicolons, question marks, and exclamation points in a given string and returns the product. If any punctuation does not occur, don't include it in the product, i.e., don't multiply by zero!
def product_punctuation(str)
  str = str.downcase.gsub(/[a-z ]/,'')
  punct = Hash.new(0)
  str.each_char {|char| punct[char.downcase] += 1}
  punct.values.reduce(:*)
end

# Translate a sentence into pig-latin! The first consonants go to the end of the word, then add "ay".
def pig_latin(sentence)
  sentence.split(' ').map {|word| word = latinize(word)}.join(' ')
end

def latinize(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  i = 0
  word.downcase.each_char.with_index do |letter,index|
    if vowels.include? letter
      i = index
      break
    end
  end
  chunk = word[0...i]
  return [word[i..-1],chunk,'ay'].join
end 

require_relative 'test.rb'