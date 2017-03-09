# PROBLEM 1

=begin

Ordered words

Both Ruby and Python let you compare letters: "a" < "z" returns true. Write a method, ordered_word?, which returns whether the letters in a word occur in alphabetical order. Assume the string contains only lowercase letters with no spaces or punctuation.

ordered_word?("amz") == true
ordered_word?("zma") == false
ordered_word?("aa") == true # repeats okay

=end

def ordered_word? (str)
  i = 0
  while i < str.size - 1
    if str[i] > str[i+1]
      return false
    else
      i += 1
    end
  end
  true
end

# PROBLEM 2

=begin

String encoding

Write a method named encrypt(str) which takes in a string and returns an array of pairs: each pair contains the next distinct letter in the string, and the number consecutive repeats.

encrypt("aaabbcbbaaa") == [
["a", 3],
["b", 2],
["c", 1],
["b", 2],
["a", 3]
]

encrypt("aaaaaaaaaa") == [["a", 10]]
encrypt("") == []

=end

def encrypt(str)
  result = []
  i = 0
  while str.size > 0
    chunk = counter(str)
    index = chunk[1]
    result << chunk
    str = str[index..-1]
  end
  result
end

def counter(str)
  i = 0
  count = 1
  while i < str.size
    if str[i] == str[i+1]
      count += 1
      i += 1
    else
      break
    end
  end
  result = [str[0], count]
  return result
end

# PROBLEM 3

=begin

Nearby words

Write a method named one_off_words(str, word_list) which takes in a string and an array of valid words (the word_list). It should return an array of words from the word_list which are the same except for a single letter at a single position.

Do not return words of that differ in length from str.

For instance, "boot" and "boom" are nearby (differ in 4th letter), but "loot" and "tool" are not (differ in first and fourth letters). Note that position matters.

Here's an example of the method:

WORDS = ["door", "moot", "boot", "boots"]
one_off_words("moor", WORDS) == ["door", "moot"]

You may assume that the input string and word list contain only lower case letters.

=end


def one_off_words(str,word_list)
  result = []
  better_list = word_list.select{|word| word.size == str.size}
  better_list.each do |word|
    i = 0
    count = 0
    while i < word.size
      count += 1 if word[i] == str[i]
      i += 1
    end
    result << word if word.size - count == 1
  end
  result
end