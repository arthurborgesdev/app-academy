# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require "byebug"

def all_vowel_pairs(words)
    pairs = []
    pos = 0
    index = 0
    while pos < words.length - 1
      while index < words.length - 1
        pairs << (words[pos] + " " + words[index+1]) if pairs?(words[pos], words[index + 1])
        index += 1
      end
      pos += 1
      index = pos
    end  
    pairs  
  end
  
  
  def pairs?(word_1, word_2)
    (vowels(word_1) + vowels(word_2)).uniq.length == 5
  end
  
  def vowels(word)
    word.split("").select {|char| "aeiou".include?(char)}
  end
  
  # p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])
  
  
  # p vowels("action") # => a, i, o
  # p pairs?("goat", "action")
  # p pairs?("action", "europe")


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).any? {|factor| num % factor == 0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    array = []
    bigram_idx = 0
    str_idx = 0
  
    while bigram_idx < bigrams.length - 1
      while str_idx < str.length - 1
        # str_idx = str_idx % str.length
        array << bigrams[bigram_idx] if str[str_idx..str_idx + 1] == bigrams[bigram_idx]
        str_idx += 1
      end
      str_idx = 0
      bigram_idx += 1
    end
    array       
  end
  
  
  # p find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
  # p find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])
  # p 20 % 20
class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      prc ||= Proc.new {|k, v| k == v}
      self.select {|k, v| prc.call(k,v) == true }
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
  def substrings(length = nil)
    subs = []
    (0...self.length).each do |start_idx|
        (start_idx...self.length).each do |end_idx|
            sub = self[start_idx..end_idx]
            subs << sub
        end
    end

    if length.nil?
        subs
    else
        subs.select {|str| str.length == length}
    end
  end

 p "cats".substrings(2)

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ("a".."z").to_a
        self.split("").map { |char| 
            alphabet[(alphabet.index(char) + num) % 26]
        }.join("")
    end
end
