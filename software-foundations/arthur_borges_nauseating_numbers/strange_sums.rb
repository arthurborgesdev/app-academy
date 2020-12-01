def strange_sums(array)
  count = 0
  i = 0
  j = 1
  while i < array.length - 1 
    while i + j < array.length
      # p "array['#{i}']: #{array[i]}"
      # p "array['#{i}' + '#{j}']: #{array[i + j]}"
      count += 1 if array[i] + array[i + j] == 0
      # p array[i] + array[i + j]
      j += 1
    end
    j = 1
    i += 1
  end
  count
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0