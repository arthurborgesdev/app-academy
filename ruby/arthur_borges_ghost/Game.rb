require "set"
require_relative "Player"
class Game

  def initialize(player1, player2, fragment, dictionary)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @fragment = fragment
    @dictionary = Set.new(File.open(dictionary).map {|word| word.chomp})
    @current_player = @player1
    @previous_player = @player2

    @losses = { @player1=>0, @player2=>0 }
  end

  def compare
    @dictionary.select {|word| word == @fragment}
  end

  def play_round
    self.display_standings
    self.take_turn(current_player)
    self.next_player!
  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    puts "Please say a letter, #{player.name}"
    input = gets.chomp
    until valid_play?(input)
      # player.alert_invalid_guess
      puts "Please say a letter, #{player.name}"
      input = gets.chomp
    end
    @fragment += input
    p @fragment
    dictionary_check(player, @fragment)
  end

  def valid_play?(string)
    valid_string = ("a".."z").include?(string)
    puts "string #{string}"
    puts "valid_string #{valid_string}"

    build_word = @fragment + string
    puts "build_word #{build_word}"
    
    valid_dictionary = @dictionary.any? {|word| word.index(build_word) == 0}
    puts "valid_dictionary #{valid_dictionary}"

    puts "valid_string && valid_dictionary #{valid_string && valid_dictionary}"
    valid_string && valid_dictionary
  end


  def dictionary_check(player, fragment)
    if @dictionary.any? {|word| word == fragment}
      @losses[player] += 1 
      @fragment = ""
    end
  end

  def record(player)
    ghost_word = "GHOST"
    substring = ghost_word[0...@losses[player]]
  end

  def run
    until @losses[@player1] == 5 || @losses[@player2] == 5
      self.play_round
    end
    winner = @losses.select {|k, v| @losses[k] < 5}
    p winner
    p "GAME OVER! #{winner.keys[0].name} WINS"
  end

  def display_standings
    p "SCOREBOARD"
    p "PLAYER1: #{@player1.name} | #{@losses[@player1]} | #{record(@player1)}"
    p "PLAYER2: #{@player2.name} | #{@losses[@player2]} | #{record(@player2)}"
    p "FRAGMENT: #{@fragment}" 
  end

end


game1 = Game.new("Arthur", "Andressa", "", "dictionary.txt")
game1.run
