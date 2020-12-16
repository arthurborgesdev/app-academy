class Maze
  attr_reader :maze_text
  def initialize
    maze = Array.new { Array.new }
    i, j = 0, 0
    File.open("maze1.txt", mode = "r") do |line| p line 
    end
  end
end

maze = Maze.new
p maze.maze_text