class Maze
  attr_reader :maze_text, :start_position, :end_position
  def initialize
    create_maze("maze1.txt")
    @start_position = position(@maze_array, "S")
    @end_position = position(@maze_array, "E")
  end

  def position(maze, point)
    @maze_array.each_with_index do |line, i|
      line.each_with_index do |elem, j|
        return([i, j]) if elem == point  
      end
    end
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
  
  def print
    @maze_array.each { |line| p line.join }
  end

  
end


maze = Maze.new
p maze.print
p maze.start_position
p maze.end_position