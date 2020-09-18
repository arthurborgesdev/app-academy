def is_prime?(number)
  return false if number < 2
  (2...number).each do |n| 
    return false if number % n == 0
  end
  true
end