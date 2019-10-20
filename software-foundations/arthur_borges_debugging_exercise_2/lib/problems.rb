# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(number)
  (1..number).select {|div| prime?(div) && divisor?(number, div)}.max
end

def prime?(number)
  return false if number < 2
  # byebug
  (2...number).each do |factor|
    return false if number % factor == 0
  end
  true
end

def divisor?(number, divisor)
  divisor if number % divisor == 0
end

# p prime?(11)
# p prime?(8)

# p largest_prime_factor(15)

def unique_chars?(string)
  hash = Hash.new(0)
  string.each_char {|char| hash[char] += 1}
  hash.size == string.length
end

# p unique_chars?("computer")

def dupe_indices(array)
  hash = {}
  out_index = 0
  in_index = 0
  indices = []
  
  while out_index < array.length - 1 # number of elements 
    indices << out_index  # recording first appearance of element indice
    # hash[array[out_index]] = indices # recording indices in hash
    while in_index <= array.length - out_index  # number of comparissons
      # byebug
      if array[out_index] == array[in_index + 1]
        indices << in_index + 1 # recording n appearance of element indice 
      end
      in_index += 1
    end
    if indices.size > 1
      hash[array[out_index]] = indices
    end
    indices = []
    out_index += 1
    in_index = out_index
  end
  p hash
end

# dupe_indices(["a", "a", "c", "c", "b", "c"])

def ana_array(array1, array2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  array1.each {|elem1| hash1[elem1] += 1}
  array2.each {|elem2| hash2[elem2] += 1}

  hash1 == hash2 
end