# require "byebug"

def matrix_addition_reloaded(*matrix)
  # p matrix[0].length
  return nil if matrix.one? { |matx| matrix[0].length != matx.length}

  add_matrix = Array.new(matrix[0].length) { Array.new (matrix[0][0].length) { 0 } }
  # p add_matrix
  j = 0
  i = 0
  k = 0
  while i < matrix[j].length
    while k < matrix[j][i].length
      while j < matrix.length
        add_matrix[i][k] += matrix[j][i][k]
        j += 1
      end
      j = 0
      k += 1
    end
    j = 0
    k = 0
    i += 1
  end
  add_matrix
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