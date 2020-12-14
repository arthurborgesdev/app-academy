# require_relative 'GameMultiplayer'
require "set"
class AiPlayer
  attr_reader :name, :losing_move, :winning_move

  def initialize(name, n, dictionary)
    @name = name
    @n = n
    @dictionary = dictionary
    @losing_move = []
    @winning_move = []
  end

  def guess(fragment)
    losing_move = []
    winning_move = []
    puts "#{name} is going to make a smart move..."
    ("a".."z").each do |letter|
      future_guess = fragment + letter
      possible_moves = @dictionary.all? do |word| 
        word.index(future_guess) && word.length - future_guess.length <= @n 
      end
      if @dictionary.include?(future_guess) 
        losing_move << letter
      elsif possible_moves 
        winning_move << letter
      else
        losing_move << letter
      end

      # p letter
      p winning_move
      p losing_move
    end

    unless winning_move.empty?
      random_win = rand(winning_move.size)
      return winning_move[random_win] unless winning_move.empty?
    else
      random_lose = rand(losing_move.size)
      p "Random: #{random_lose}"
      p losing_move[random_lose]
      return losing_move[random_lose]
    end
  end
end