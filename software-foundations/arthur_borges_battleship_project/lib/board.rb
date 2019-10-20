class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    @grid.flatten.select {|pos| pos == :S}.count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    row_elements = Math.sqrt(@size)
    quantity = @size / 4
    while @grid.flatten.count(:S) < quantity  do 
      row_random = rand(0..row_elements)
      collum_random = rand(0..row_elements)
      if @grid[row_random][collum_random] == :N
        @grid[row_random][collum_random] = :S 
      end
    end
  end

  def hidden_ships_grid
    @grid.map do |line| 
      line.map do |elem|
        (elem == :S ? :N : elem)
      end
    end
  end

  def self.print_grid(grid)
    grid.each do |line|
      line.each_with_index do |elem, index|
        print elem 
        print " " if index < line.length - 1
      end
      print "\n"
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
