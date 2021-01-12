class Maze
  attr_reader :maze_text, :start_position, :end_position
  def initialize
    create_maze("maze1.txt")
    @start_position = get_position(@maze, "S")
    @end_position = get_position(@maze, "E")
    @current_position = init_node(start_position)
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

  def get_position(maze, point)
    @maze.each_with_index do |line, i|
      line.each_with_index do |elem, j|
        return([i, j]) if elem == point  
      end
    end
  end

  def init_node(position)
    position_status = { 
      position: [position[0], position[1]], 
      parent: nil,
      G: 0, 
      H: 0, 
      F: 0
    }
  end

  def calculate_H(position)
    ((position[0] - @end_position[0]).abs + (position[1] - @end_position[1]).abs - 1) * 10
  end

  def print
    @maze.each { |line| p line.join }
  end

  def search_adjacents(node)
    adjacents = []
    x = node[:position][0]
    y = node[:position][1]
    (x - 1..x + 1).each do |i|
      (y - 1..y + 1).each do |j|
        adjacents << calculate_F([i, j], node) unless i == x && j == y || invalid([i, j])
      end
    end 
    adjacents
  end

  def inside_closed_list(position)
    @closed_list.each do |closed_pos|
      return true if closed_pos[:position] == position
    end 
    false
  end

  def invalid(position)
    x = position[0]
    y = position[1]
    @maze[x][y] == "*" || inside_closed_list(position)
  end

  def first_diagonal?(x1, y1, x2, y2)
    (x1 - y1).abs == (x2 - y2).abs
  end

  def second_diagonal?(x1, y1, x2, y2)
    (x1 - y1).abs == (x2 - y2).abs - 1
  end

  def calculate_F(position, parent)
    x1 = position[0]
    y1 = position[1]
    x2 = parent[:position][0]
    y2 = parent[:position][1]

    if first_diagonal?(x1, x2, y1, y2) || second_diagonal?(x1, x2, y1, y2)
      calculated_G_score = parent[:G] + 14
    else
      calculated_G_score = parent[:G] + 10
    end
    
    calculated_H_score = calculate_H(position)

    position_status = { 
      position: [position[0], position[1]], 
      parent: parent,
      G: calculated_G_score, 
      H: calculated_H_score, 
      F: calculated_G_score + calculated_H_score 
    }
  end

  def find_lowest_F(list)
    # list.reject! { |hash| hash[:position] == @current_position }
    # p @open_list
    # p @closed_list
    lowest_F_value = list.map { |hash| hash[:F] }.min
    # p lowest_F_value
    lowest_F_point = list.select { |hash| hash[:F] <= lowest_F_value }.first
  end

  def move(node)

    @maze[node[0]][node[1]] = "X"
    [node[0], node[1]]
  end
=begin
  def adjacents(point, parent = nil)
        # p @open_list.include?(point[i, j])
        unless point[0] + point[1] == i + j || # second diagonal
          (point[0] - point[1]).abs == (i - j).abs || # first diagonal
          @maze[i][j] == "*" ||
          @open_list.include?(point[i, j])
          parent ? point_G_calc = parent[:G] + 10 : point_G_calc = 0
          point_H_calc = H_calc(point)
          hash_point = { 
            point: [i, j], 
            G: point_G_calc, 
            H: point_H_calc, 
            F: point_G_calc + point_H_calc 
          }
          @open_list << hash_point
          p "@open_list: #{@open_list}"
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

  def random_move(hash_point)
    random_index = rand(hash_point.size)
    move_point = hash_point[random_index][:point]
    @maze[move_point[0]][move_point[1]] = "X"
    [move_point[0], move_point[1]]
  end

  def run
    start_position = { point: @current_position, G: 0, H: 0, F: 0 }
    @open_list << start_position
    adjacents(@current_position)
    # p @closed_list
    # p "current_position: #{@current_position}"
    new_parent = @open_list.select {|hash| hash[:point] == @current_position }.first
    @closed_list << new_parent

    @open_list.reject! { |hash| hash[:point] == @current_position }
    # p @open_list
    # p @closed_list
    lowest_F_value = @open_list.map { |hash| hash[:F] }.min
    # p lowest_F_value
    lowest_F_point = @open_list.select { |hash| hash[:F] <= lowest_F_value }
    # p lowest_F_point
    @current_position = random_move(lowest_F_point)

    puts "@current_position: #{@current_position}"
    puts "@closed_list: #{@closed_list}"
    puts "@open_list: #{@open_list}"
    puts "lowest_F_value: #{lowest_F_value}"
    puts "lowest_F_point: #{lowest_F_point}"
    puts @maze
    puts
    
    until lowest_F_point == @end_position 
      new_parent = @open_list.select {|hash| hash[:point] == @current_position }.first
      @closed_list << new_parent
      adjacents(@current_position, new_parent)

      new_parent = @open_list.select {|hash| hash[:point] == @current_position }
      @closed_list << new_parent
      @open_list.reject! { |hash| hash[:point] == @current_position }
      # p @open_list
      # p @closed_list
      lowest_F_value = @open_list.map { |hash| hash[:F] }.min
      # p lowest_F_value
      lowest_F_point = @open_list.select { |hash| hash[:F] <= lowest_F_value }
      # p lowest_F_point
      @current_position = random_move(lowest_F_point)
      p "@current_position: #{@current_position}"
      p @maze

      print
    end
  end  
=end
  def change_path(new_position, current_position)
    @open_list[new_position[0], new_position[1]] = calculate_F(new_position)
    @open_list[new_position[0], new_position[1]][:parent] = current_position
  end

  def run
    loop do
      @open_list << @current_position
      adjacents = search_adjacents(@current_position)
      @open_list = @open_list.union(adjacents)
      @closed_list << @open_list.delete(@current_position)
  
      lowestF = find_lowest_F(@open_list)
      move(lowestF[:position])
      # print
      previous_parent = @open_list.delete(lowestF)
      # p "new_node: #{new_node}"
      @closed_list << previous_parent
      # p "@closed_list: #{@closed_list}"
      adjacents = search_adjacents(previous_parent)
  
      
      # p adjacents.intersection(@open_list)
      p "@open_list: #{@open_list}"
      p "----------------------------------------------"
      p "adjacents: #{adjacents}"
      p "----------------------------------------------"
      p "@closed_list: #{@closed_list}"
      @open_list.each do |open_pos|
        adjacents.each do |adj_pos|
          if open_pos[:position] == adj_pos[:position]
            change_path(adj_pos[:position], previous_parent) if adj_pos[:G] < open_pos[:G]
            # p "open_pos: #{open_pos}"
            # p "adj_pos: #{adj_pos}"
            # p open_pos[:G]
            # p adj_pos[:G]
          end
        end
      end
      print
      break if inside_closed_list(@end_position) 
    end
  end
end

maze = Maze.new

p maze
maze.print
maze.run
maze.print