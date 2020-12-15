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
    tree = {}
    ("a".."z").each do |letter|
      future_guess = fragment + letter
      # p future_guess
      possible_moves = @dictionary.select do |word|
        word.index(future_guess) == 0
      end 
      tree[letter] = {
        branch: possible_moves,
        losses: 0,
        wins: 0
      }
      puts "possible_moves: #{tree[letter][:branch]}"
      wins = tree[letter][:branch].count { |word| word.length - future_guess.length <= @n }
      tree[letter][:wins] += wins
      p "Wins: #{wins}"
      if tree[letter][:branch].include?(future_guess) 
        tree[letter][:losses] += 1
      end
      puts "Tree: #{tree}"
    end
    calc_balance = {}
    tree.each { |letter, value| calc_balance[letter] = value[:wins] - value[:losses] }
    p calc_balance




=begin
    unless winning_move.empty?
      random_win = rand(winning_move.size)
      return winning_move[random_win] 
    else
      random_lose = rand(losing_move.size)
      return losing_move[random_lose]
    end
=end
  end

end