class Maze
  attr_reader :maze_text, :start_position, :end_position
  def initialize
    create_maze("maze1.txt")
    @start_position = position(@maze, "S")
    @end_position = position(@maze, "E")
    @current_position = start_position
    @open_list = []
    @closed_list = []
  end

  def create_maze(file)
    @maze = []
    i = 0
    File.open("maze1.txt").each_with_index do |line, j|
      @maze << []
      while i < line.chomp.length 
        @maze[j] << line.chomp.split('')[i]
        i += 1
      end
      i = 0
    end
  end

  def position(maze, point)
    @maze.each_with_index do |line, i|
      line.each_with_index do |elem, j|
        return([i, j]) if elem == point  
      end
    end
  end

  def H_calc(point)
    (point[0] - @end_position[0]).abs + (point[1] - @end_position[1]).abs - 1
  end

  def print
    @maze.each { |line| p line.join }
  end

  def adjacents(point, parent = nil)
    i = point[0] - 1
    j = point[1] - 1
    while i <= point[0] + 1
      while j <= point[1] + 1
        p "i: #{i}"
        p "j: #{j}"
        p "@maze#{[i]}#{[j]}: #{@maze[i][j]}"
        # p "point[0]: #{point[0]}"
        # p "point[1]: #{point[1]}"
        # p point[0] + point[1] == i + j
        # p (point[0] - point[1]).abs == (i - j).abs
        # p @maze[i][j] == "*"
        # p @open_list.include?(point[i, j])
        unless point[0] + point[1] == i + j || # second diagonal
          (point[0] - point[1]).abs == (i - j).abs || # first diagonal
          @maze[i][j] == "*" ||
          @open_list.include?(point[i, j])
          parent ? point_G_calc = parent.G + 10 : point_G_calc = 0
          point_H_calc = H_calc(point)
          hash_point = { 
            point: [i, j], 
            G: point_G_calc, 
            H: point_H_calc, 
            F: point_G_calc + point_H_calc 
          }
          @open_list << hash_point
          p @open_list
        end
        j += 1
      end
      j = 0
      i += 1
    end
  end

  def valid_adjacents(adjacent_positions)
    valids = adjacent_positions.select! { |point| @maze[point[0]][point[1]] == " " }
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
    puts "@maze: #{@maze}"
    # position_first = position.first
    @maze[position[0]][position[1]] == "E"
  end

  def run
    start_position = { point: @current_position, G: 0, H: 0, F: 0 }
    @open_list << start_position
    adjacents(@current_position)
    @closed_list = @open_list.delete(@current_position)
    p @open_list
    p @closed_list
  end  
=begin  
    # p @maze[@current_position[0]][@current_position[1]]
    until end_game?(step(@current_position))
      p @current_position
      @current_position = step(@current_position)
      p @current_position
      # position_first = @current_position.first
      p @maze[@current_position[0]][@current_position[1]]
      @maze[@current_position[0]][@current_position[1]] = "X"
      self.print
    end
    self.print
  end
end
=end
end

maze = Maze.new
# p maze.print
# p maze.start_position
# p maze.end_position
# p maze.adjacents(maze.start_position)
# p maze.adjacents(maze.end_position)

# p maze.valid_adjacents(maze.adjacents(maze.end_position))

# p maze.end_game?(maze.valid_adjacents(maze.adjacents(maze.end_position)))
p maze
maze.run