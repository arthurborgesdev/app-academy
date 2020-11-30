def proper_factors(num)
  (1...num).select { |n| num % n == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num) ? true : false
end

def ideal_numbers(n)
  ideal = []
  times = 0
  num = 1
  loop do
    if perfect_number?(num)
      ideal << num
      times += 1
      break if n == times
    end
    num += 1
  end
  ideal
end