class Maze
  attr_reader :maze_text
  def initialize
    maze = Array.new { Array.new }
    i, j = 0, 0
    File.open("maze1.txt", mode = "r") do |line| p line 
    end
  end
end

# maze = Maze.new
# p maze.maze_text
p "aiushdui111"
size = 0
File.open("maze1.txt").each do |line|
  size = line.chomp.length
  break
end
maze_array = Array.new(size) { Array.new(size) }
i = 0
File.open("maze1.txt").each_with_index do |line, j|
  while i < line.chomp.length 
    maze_array[j][i] = line.chomp.split('')[i]
    i += 1
  end
  i = 0 
end

p maze_array
