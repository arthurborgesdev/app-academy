def proctition(array, &prc)
  new_array = []
  array.each {|elem| new_array.push(elem) if prc.call(elem) }
  array.each {|elem| new_array.push(elem) unless prc.call(elem) }
  new_array
end

p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# [4, 7, 1, 3, -5, -10, -2]

p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# [8, 6, 10, 7, 3]

p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# ["boot", "bug", "boat", "cat", "dog"]