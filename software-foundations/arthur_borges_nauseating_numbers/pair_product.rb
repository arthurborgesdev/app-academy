def pair_product(array, product)
  i = 0
  j = 1
  catch :iterate do
    while i < array.length - 1 
      while i + j < array.length
        # p "array['#{i}']: #{array[i]}"
        # p "array['#{i}' + '#{j}']: #{array[i + j]}"
        throw :iterate if array[i] * array[i + j] == product
        # p array[i] + array[i + j]
        j += 1
      end
      j = 1
      i += 1
    end
    return false
  end
  true
end


p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false