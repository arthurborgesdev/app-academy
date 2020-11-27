require 'prime'
require 'byebug'

def prime_factorization(num)
  return [num] if Prime.prime?(num)
  factor, result = least_divisor(num)
  prime_factorization(result) << factor
end

def least_divisor(num)
  # debugger 
  (2..9).to_a.reverse.each do |factor|
    return [factor, num / factor] if num % factor == 0 && Prime.prime?(factor)
  end
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]