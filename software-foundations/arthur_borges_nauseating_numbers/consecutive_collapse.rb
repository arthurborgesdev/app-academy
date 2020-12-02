def consecutive_collapse(array)
  i = 0
  until consecutive_array?(array)
    if (array[i] - array[i + 1]).abs == 1
      array.delete_at(i)
      array.delete_at(i)
      # p "array: #{array}"
      i = 0
    else 
      # p "ARRAY: #{array}"
      i += 1
    end
  end
  array
end

def consecutive_array?(array)
  i = 0
  count = []
  while i < array.length - 1
    (array[i] - array[i + 1]).abs == 1 ? count << false : count << true
    i += 1
  end
  count.all?
end


p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []