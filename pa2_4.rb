# Define a method that returns a boolean indicating whether its second argument is a substring of its first.
def substring?(long_string, short_string)
  long_string.include? short_string
end

# Write a method that, given a string, returns a hash in which each key is a character in the string and each value is an array of the first and last indices where that character occurs. If the character occurs only once, the array should contain a single index. Consider defining helper methods.
# first_last_indices("banana") => {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
def first_last_indices(str)
  result = Hash.new
  str.each_char do |x|
    result[x] = get_indices(str,x)
  end 
  result
end

def get_indices(str,char)
  first = str.index(char)
  last = str.size - str.reverse.index(char) - 1
  [first, last].uniq
end
# Define a method that returns the number of times that two adjacent numbers in an array sum to n. Don't reuse numbers.
# count_adjacent_sums([1, 5, 1, 3, 3], 6) => 2
def count_adjacent_sums(array, n)
  count = 0
  i = 0 
  while i < array.size - 1
    if array[i] + array[i+1] == n
      count += 1
      i += 2
    else
      i += 1
    end
  end
  count
end

require_relative 'test.rb'
