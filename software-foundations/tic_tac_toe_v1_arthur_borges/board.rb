class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) { '_' } }
  end

  def valid?(position)
    position[0] >= 0 && position[0] < 3 && position[1] >= 0 && position[1] < 3
  end

  def empty?(position)
    p position
    @grid[position] == '_'
  end
  
  def place_mark(position, mark)
    raise "Position is not valid or position is not empty" unless self.valid?(position) || self.empty?(position)
    grid[position] = mark
  end

end