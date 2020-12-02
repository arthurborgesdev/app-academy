def squarocol?(array)
  i = 0
  j = 0
  size = array[0].length
  compare_arr = []
  catch :result do 
    while i < size
      while j < size
        compare_arr << array[i][j] 
        j += 1
      end
      # p "compare_arr: #{compare_arr}"
      throw :result if compare_arr.uniq.size <= 1
      j = 0
      i += 1
      compare_arr = []
    end
    i = 0
    j = 0
    while j < size
      while i < size
        compare_arr << array[i][j] 
        i += 1
      end
      # p "compare_arr: #{compare_arr}"
      throw :result if compare_arr.uniq.size <= 1
      i = 0
      j += 1
      compare_arr = []
    end
    return false
  end
  true
end

p squarocol?([
  [:a, :x , :d],
  [:b, :x , :e],
  [:c, :x , :f],
]) # true

p squarocol?([
  [:x, :y, :x],
  [:x, :z, :x],
  [:o, :o, :o],
]) # true

p squarocol?([
  [:o, :x , :o],
  [:x, :o , :x],
  [:o, :x , :o],
]) # false

p squarocol?([
  [1, 2, 2, 7],
  [1, 6, 6, 7],
  [0, 5, 2, 7],
  [4, 2, 9, 7],
]) # true

p squarocol?([
  [1, 2, 2, 7],
  [1, 6, 6, 0],
  [0, 5, 2, 7],
  [4, 2, 9, 7],
]) # false