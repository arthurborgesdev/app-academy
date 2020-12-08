class Board
  attr_reader :grid, :size

  def initialize(size)
    @size = size
    @grid = Array.new(size) { Array.new(size) { '_' } }
  end

  def valid?(position)
    position[0] >= 0 && position[0] < size && position[1] >= 0 && position[1] < size
  end

  def empty?(position)
    grid[position[0]][position[1]] == '_'
  end
  
  def place_mark(position, mark)
    raise "invalid mark" unless self.valid?(position) && self.empty?(position)
    grid[position[0]][position[1]] = mark
  end

  def print
    grid.each { |line| p line }
  end
  
  def win_row?(mark)
    grid.any? { |line| line.all?(mark) }
  end

  def win_col?(mark)
    grid.transpose.any? { |line| line.all?(mark) }
  end

  def win_diagonal?(mark)
    first_diagonal, second_diagonal = [], []
    i, j = 0, 0
    while i < grid.length
      while j < grid[i].length
        first_diagonal << grid[i][j] if i = j
        j += 1
      end
      j = 0
      i += 1
    end
    i, j = 0, 0
    while i < grid.length
      while j < grid[i].length
        second_diagonal << grid[i][j] if i + j == grid.length - 1
        j += 1
      end
      j = 0
      i += 1
    end
    [first_diagonal, second_diagonal].any? { |diagonal| diagonal.all?(mark) }
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    grid.any? { |line| line.any?('_') }
  end

  def legal_positions
    pos = []
    i, j = 0, 0
    while i < grid.length
      while j < grid[i].length
        pos << [i, j] if grid[i][j] == '_'
        j += 1
      end
      j = 0
      i += 1
    end
    pos
  end
end

# b = Board.new
# b.print