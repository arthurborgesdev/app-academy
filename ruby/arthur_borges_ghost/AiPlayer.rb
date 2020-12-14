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
    puts "#{name} is going to make a smart move..."
    ("a".."z").each do |letter|
      future_guess = fragment + letter
      p future_guess
      # p @dictionary.include?(future_guess)
      if @dictionary.include?(future_guess) 
        losing_move.push(letter)
        # p losing_move
      elsif @dictionary.all? { |word| word.index(future_guess) == 0 && word.length - future_guess.length <= @n }
        winning_move << letter
      end

      # p letter
      p winning_move
      p losing_move
    end

    return winning_move[rand(winning_move.size)] unless winning_move.empty?
    return losing_move[rand(losing_move.size)]
  end
end