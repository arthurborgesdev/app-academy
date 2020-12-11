# require_relative 'GameMultiplayer'
require "set"
class AiPlayer
  attr_reader :name

  def initialize(name, n, fragment, dictionary)
    @name = name
    @n = n
    @fragment = fragment
    @dictionary = dictionary
  end

  def guess
    puts "#{name} is going to make a smart move..."
    @losing_move = []
    @winning_move = []

    ("a".."z").each do |letter|
      dictionary_check(letter, @fragment)
      p @winning_move
      p @losing_move
    end

    return @winning_move[rand(@winning_move.size)] unless @winning_move.empty?
    return @losing_move[rand(@losing_move.size)]
  end

  def dictionary_check(letter, fragment)
    future_guess = fragment + letter
    if word.index(future_guess) == 0 
      # INVESTIGAR
    @dictionary.each do |word| 
      if future_guess == word 
        @losing_move << letter
      elsif
          @winning_move << letter if word.length - future_guess.length < @n
        end
      end
    end
  end
end