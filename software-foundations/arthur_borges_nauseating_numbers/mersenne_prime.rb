require 'prime'

def mersenne_prime(n)
  mersenne = mersenne?(n)
  return true if Prime.prime(mersenne)
  false
end

def mersenne?(num)
  x = 1
  count = 0
  while count < 2 ** x - 1
    return count if count == 2 ** x - 1
    count += 1
    x += 1
  end
  false
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071