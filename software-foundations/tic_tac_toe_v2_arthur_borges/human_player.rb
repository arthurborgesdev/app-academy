class HumanPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    p "It's #{mark} turn!"
    p "Enter a position in a format 'row col', in which row and col are numbers: "
    position = gets.chomp
    raise "Enter the above format!!" unless position.split(" ").length == 2
    mark = position.split(" ").map { |elem| elem.to_i } 
  end
end