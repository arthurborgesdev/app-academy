def matrix_addition_reloaded(*matrix)
  # p matrix[0].length
  return nil if matrix.one? { |matx| matrix[0].length != matx.length}
  
  add_matrix = Array.new(matrix[0].length) { Array.new (matrix[0][0]) { 0 } }
#=begin 
  j = 0
  i = 0
  while j < matrix.length
    while i < matrix[j].length 
      # p "add_matrix['#{j}']['#{i}']: #{matrix_1[j][i]} + #{matrix_2[j][i]}"
      p matrix
      # add_matrix[j][i]
      # matrix[j][i] = matrix_1[j][i] + matrix_2[j][i]
      i += 1
    end
    i = 0
    j += 1
  end
  mx
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil