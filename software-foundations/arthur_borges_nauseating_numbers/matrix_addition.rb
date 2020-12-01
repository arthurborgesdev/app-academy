def matrix_addition(matrix_1, matrix_2)
  matrix = Array.new(matrix_1.length) { Array.new (2) { 0 } }
#=begin 
  j = 0
  i = 0
  while j < matrix_1.length
    while i < matrix_1[j].length 
      # p "matrix_1['#{j}']['#{i}']: #{matrix_1[j][i]} + #{matrix_2[j][i]}"
      matrix[j][i] = matrix_1[j][i] + matrix_2[j][i]
      i += 1
    end
    i = 0
    j += 1
  end
  matrix
#=end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]