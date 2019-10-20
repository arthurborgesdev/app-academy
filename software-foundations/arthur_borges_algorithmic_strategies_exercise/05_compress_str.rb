# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are extracted.
# For example "aaabbc" is extracted to "3a2bc".

def compress_str(str)
  compressed = ""
  extract(str).each { |elem|(elem.size == 1 ? compressed += elem : 
    compressed += elem.size.to_s + elem.split("")[0] 
  )} 
  compressed
end

def extract(str)
  extracted = []
  equal_word = ""
  str.split("").each_with_index do |char, index|
    equal_word = char if equal_word.size == 0
    if str[index] == str[index+1]
      equal_word += char
    else
      extracted << equal_word
      equal_word = ""
    end
  end
  extracted
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"