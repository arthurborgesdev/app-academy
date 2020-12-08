class ComputerPlayer
  attr_reader :mark
  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    p "It's Computer turn!"
    p "Computer is playing with #{mark}"
    legal_positions[rand(legal_positions.length)]
  end

end