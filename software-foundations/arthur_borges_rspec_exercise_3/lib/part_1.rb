require 'byebug'

def is_prime?(number)
  return false if number < 2
  (2...number).each do |n| 
    return false if number % n == 0
  end
  true
end

def nth_prime(n)
  number = 0
  times = 0
  loop do 
    times += 1 if is_prime?(number)
    return number if n == times
    number += 1
  end
end

def prime_range(min, max)
  (min..max).select { |number| is_prime?(number) }
end