require './board'
require './human_player'

class Game
  def initialize(size, option)
    @board = Board.new(size)
    @players = []
    option.each do |mark, player_type| 
      player_type ? @players << ComputerPlayer.new(mark) : @players << HumanPlayer.new(mark) 
    end
    @current_player = @players[0]
  end

  def switch_turn
    @current_player = @players.rotate![0]
  end

  def play
    while @board.empty_positions?
      @board.print
      if @board.win?(@board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark))
        p "Victory - #{@current_player} --- #{@current_player.mark} Wins!"
        return
      else 
        self.switch_turn
      end
    end
    p "Draw! Nobody wins! (Or everyone does...)"
  end
end