require 'prime'

def pretentious_primes(array, n)
  array.map {|elem| nearest_prime(elem, n) }
end

def nearest_prime(number, position)
  count = 0
  if position > 0
    loop do 
      number += 1
      count += 1 if Prime.prime?(number)
      return number if count == position
    end
  else
    while number > 2
      number -= 1
      count += 1 if Prime.prime?(number)
      return number if count == -position
    end
  end  
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]