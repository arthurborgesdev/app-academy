require 'prime'
require 'byebug'
def bi_prime?(num)
  factors = Prime.prime_division(num)
  if factors.length <= 2
    # debugger
    if factors[0][0] == 2 && factors[0][1] == 1 && factors[1][1] == 1
      return true
    elsif factors[0][0].odd?
      return true
    end
  end
  false
end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false