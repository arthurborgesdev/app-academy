def pascals_triangle(n)
  array = [[1]]
  levels = 1
  while levels < n
    last_array = array[-1]
    current_array = add_zeroes(last_array)
    i = 0
    next_array = []
    while i < current_array.length - 1
      next_array << current_array[i] + current_array[i + 1]
      i += 1
    end
    array << next_array
    levels += 1
  end
  array.map do |inner_arr| 
    inner_arr.keep_if { |elem| elem != 0 }
  end
end

def add_zeroes(array)
  array.push(0).unshift(0)
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]