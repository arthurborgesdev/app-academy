require "set"
require_relative "Player"
require_relative "AiPlayer"

class GameMultiplayer

  attr_reader :players, :fragment

  def initialize(fragment, dictionary, *players)
    @players = players.map {|player| Player.new(player)}
    @dictionary = Set.new(File.open(dictionary).map {|word| word.chomp})
    @players.push(AiPlayer.new("H-1000", players.length, @dictionary))
    @fragment = fragment
    @current_player = @players[0]
    @previous_player = @players[-1]

    @losses = Hash.new(0)
    players.each {|player| @losses[player] = 0}
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
    atual_index = @players.index(@current_player)
    next_index = (atual_index + 1) % @players.length
    @current_player = @players[next_index]
  end

  def take_turn(player)
    player.is_a?(AiPlayer) ? answer = player.guess(fragment) : answer = player.guess
    until valid_play?(answer)
      # player.alert_invalid_guess
      player.is_a?(AiPlayer) ? player.guess(fragment) : answer = player.guess
    end
    @fragment += answer
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
      @losses[player.name] += 1 
      @fragment = ""
    end
  end

  def record(player)
    ghost_word = "GHOST"
    substring = ghost_word[0...@losses[player.name]]
  end

  def run
    until @players.length == 1 
      self.play_round
      @players.reject! {|player| @losses[player.name] == 2}
    end
    p "GAME OVER! #{@players[0].name} WINS"
  end

  def display_standings
    p "SCOREBOARD"
    @players.each do |player|
      p "#{player.name} | #{@losses[player.name]} | #{record(player)}"
    end
    p "FRAGMENT: #{@fragment}" 
  end

end


game1 = GameMultiplayer.new("", "dictionary.txt", "Arthur", "Andressa", "Cleide")
game1.run