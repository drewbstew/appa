# Every Other Letter

# Define a method, #every_other_letter(string), that accepts a string as an argument.
# This method should return a new string that contains every other letter of the
# original string, starting with the first character.

def every_other_letter(string)
  string.split('').select.with_index {|char,index| char if index.even?}.join
end

puts "------Every Other Letter------"
puts every_other_letter("abcde") == "ace"
puts every_other_letter("i heart ruby") == "ihatrb"
puts every_other_letter("an apple a day...") == "a pl  a.."