require './board'
require './human_player'

class Game
  def initialize(size, player_1_mark, player_2_mark)
    @board = Board.new(size)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)

    @current_player = @player_1
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    @current_player
  end

  def play
    while @board.empty_positions?
      @board.print
      if @board.win?(@board.place_mark(@current_player.get_position, @current_player.mark))
        p "Victory - #{@current_player} --- #{@current_player.mark} Wins!"
        return
      else 
        self.switch_turn
      end
    end
    p "Draw! Nobody wins! (Or everyone does...)"
  end
end