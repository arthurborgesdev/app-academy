require 'prime'

def mersenne_prime(n)
  count = 0 
  number = 0
  loop do
    # p "count: #{count}"
    # p "n: #{n}"
    count += 1 if Prime.prime?(mersenne(number))
    return mersenne(number) if count == n
    number += 1
  end
end

def mersenne(num)
  2 ** num - 1
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071