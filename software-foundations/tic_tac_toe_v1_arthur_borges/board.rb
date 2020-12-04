class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) { '_' } }
  end

  def valid?(position)
    position[0] >= 0 && position[0] < 3 && position[1] >= 0 && position[1] < 3
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

end

# b = Board.new
# b.print