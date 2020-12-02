def squaragonal?(array)
  i = 0
  j = 0
  size = array[0].length
  results = []
  compare_arr = []
  while i < size
    while j < size
      compare_arr << array[i][j] if i = j
      j += 1
    end
    j = 0
    i += 1
  end
  i = 0
  j = 0
  # p "1st_diag: #{compare_arr}"
  results << true if compare_arr.uniq.size <= 1
  compare_arr = []
  while i < size
    while j < size
      # p "i + j == size : #{i} + #{j} == #{size}"
      compare_arr << array[i][j] if i + j == size - 1
      j += 1
    end
    j = 0
    i += 1
  end
  # p compare_arr
  results << true if compare_arr.uniq.size == 1
  # p results
  results.any?
end

p squaragonal?([
  [:x, :y, :o],
  [:x, :x, :x],
  [:o, :o, :x],
]) # true

p squaragonal?([
  [:x, :y, :o],
  [:x, :o, :x],
  [:o, :o, :x],
]) # true

p squaragonal?([
  [1, 2, 2, 7],
  [1, 1, 6, 7],
  [0, 5, 1, 7],
  [4, 2, 9, 1],
]) # true

p squaragonal?([
  [1, 2, 2, 5],
  [1, 6, 5, 0],
  [0, 2, 2, 7],
  [5, 2, 9, 7],
]) # false