class Maze
  attr_reader :maze_text, :start_position, :end_position
  def initialize
    create_maze("maze1.txt")
    @start_position = position(@maze_array, "S")
    @end_position = position(@maze_array, "E")
    @current_position = start_position
  end

  def create_maze(file)
    @maze_array = []
    i = 0
    File.open("maze1.txt").each_with_index do |line, j|
      @maze_array << []
      while i < line.chomp.length 
        @maze_array[j] << line.chomp.split('')[i]
        i += 1
      end
      i = 0
    end
  end

  def position(maze, point)
    @maze_array.each_with_index do |line, i|
      line.each_with_index do |elem, j|
        return([i, j]) if elem == point  
      end
    end
  end

  def print
    @maze_array.each { |line| p line.join }
  end

  def adjacents(point)
    return [
      [point[0] - 1, point[1]],
      [point[0], point[1] + 1],
      [point[0] + 1, point[1]],
      [point[0], point[1] - 1]
    ]
  end

  def valid_adjacents(adjacent_positions)
    valids = adjacent_positions.select! { |point| @maze_array[point[0]][point[1]] == " " }
  end

  def random_move(valid_adjacents)
    random_index = rand(valid_adjacents.size)
    valid_adjacents[random_index]
  end

  def step(position)
    adjacent_position = adjacents(position)
    valid_positions = valid_adjacents(adjacent_position)
    random_move(valid_positions)
  end

  def end_game?(position)
    puts "position: #{position}"
    puts "@maze_array: #{@maze_array}"
    # position_first = position.first
    @maze_array[position[0]][position[1]] == "E"
  end

  def run
    # p @maze_array[@current_position[0]][@current_position[1]]
    until end_game?(step(@current_position))
      p @current_position
      @current_position = step(@current_position)
      p @current_position
      # position_first = @current_position.first
      p @maze_array[@current_position[0]][@current_position[1]]
      @maze_array[@current_position[0]][@current_position[1]] = "X"
      self.print
    end
    self.print
  end

end


maze = Maze.new
# p maze.print
# p maze.start_position
# p maze.end_position
# p maze.adjacents(maze.start_position)
# p maze.adjacents(maze.end_position)

# p maze.valid_adjacents(maze.adjacents(maze.end_position))

# p maze.end_game?(maze.valid_adjacents(maze.adjacents(maze.end_position)))
maze.run