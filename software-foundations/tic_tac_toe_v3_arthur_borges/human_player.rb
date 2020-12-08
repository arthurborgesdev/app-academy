class HumanPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    p "It's #{mark} turn!"
    position = []
    until legal_positions.include?(position)
      p "Enter a position in a format 'row col', in which row and col are numbers: "
      p "These are the legal positions: #{legal_positions}"
      position = gets.chomp.split.map { |elem| elem.to_i}
      p "#{position} is not a legal position" unless legal_positions.include?(position)
    end
    position 
  end
end