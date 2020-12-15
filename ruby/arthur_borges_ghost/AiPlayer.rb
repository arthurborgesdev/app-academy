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
    possible_moves = []
    puts "#{name} is going to make a smart move..."
    ("a".."z").each do |letter|
      future_guess = fragment + letter
      # p future_guess
      possible_moves = @dictionary.select do |word|
        word.index(future_guess) == 0
      end 
      compute_tree(possible_moves)
      puts "possible_moves: #{possible_moves}"
      smart_move = possible_moves.any? { |word| word.length - future_guess.length <= @n }
      p "Smart_move: #{smart_move}"
      if @dictionary.include?(future_guess) 
        losing_move << letter
      elsif smart_move
        winning_move << letter
      end
      puts "Winning_moves: #{winning_move}"
      puts "losing_moves: #{losing_move}"
    end

    unless winning_move.empty?
      random_win = rand(winning_move.size)
      return winning_move[random_win] 
    else
      random_lose = rand(losing_move.size)
      return losing_move[random_lose]
    end
  end

  def compute_tree(moves)
    tree = { 
      branch = Array.new {  }
        
      ]
         

  end
end