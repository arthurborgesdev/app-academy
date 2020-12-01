def anti_prime?(num)
  divisors(num) > (1...num).map { |n| divisors(n) }.max
end

def divisors(num)
  (1..num).count { |n| num % n == 0 }
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false