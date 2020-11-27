def lucas_sequence(length)
  return [] if length == 0
  return lucas_sequence(0) << 2 if length == 1
  return lucas_sequence(1) << 1 if length == 2
  return lucas_sequence(length - 1) << lucas_sequence(length - 1)[-1] + lucas_sequence(length - 1)[-2]
end

# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]