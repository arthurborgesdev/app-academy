def no_dupes?(arr)
  count = Hash.new(0)
  arr.each { |elem| count[elem] += 1 }
  
  no_duped = []
  count.each { |k, v| no_duped << k if v == 1 }
  p no_duped
end

# Examples
no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
no_dupes?([true, true, true])            # => []

