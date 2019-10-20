class Player
  def get_move
    print 'enter a position with coordinates separated with a space like `4 7`'
    input = gets.chomp
    [input.split(" ")[0].to_i, input.split(" ")[1].to_i]
  end
end
