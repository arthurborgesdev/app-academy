def counted_characters(str)
  count = Hash.new(0)
  str.split("").each { |char| count[char] += 1 }
  count.select { |key, value| value > 2 }.keys
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []