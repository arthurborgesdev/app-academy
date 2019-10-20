# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
require "byebug"

def least_common_multiple(num_1, num_2)
    the_least = 1
    until(the_least % num_1 == 0) && (the_least % num_2 == 0)
      the_least += 1
    end
    return the_least
  end
  
  # p least_common_multiple(4, 10)


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = []
    index = 0
    while index < str.length - 1
      bigrams << str[index] + str[index+1]
      index += 1
    end
    # p bigrams
    count = Hash.new(0)
    bigrams.each {|bigram| count[bigram] += 1}
    count.max_by {|k, v| v}[0]
  end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.map {|k, v| new_hash[v] = k}
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        out_index = 0
        index = 0
        sum = 0
    
        while index < self.length - 1
          while out_index < self.length - 1
            sum += 1 if (self[index] + self[out_index + 1]) == num
            out_index += 1
            # p "index #{index}"
            # p "out_index #{out_index}"
          end
          index += 1
          out_index = index
        end
        sum
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b }

        sorted = false

        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
              if prc.call(self[i], self[i + 1]) == 1
                sorted = false
                self[i], self[i + 1] = self[i + 1], self[i]
              end
            end
        end
        self
    end
end
