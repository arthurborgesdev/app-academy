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
      # p "possible_moves: #{tree[letter][:branch]}"
      wins = tree[letter][:branch].count { |word| word.length - future_guess.length <= @n }
      tree[letter][:wins] += wins
      # p "Wins: #{wins}"
      if tree[letter][:branch].include?(future_guess) 
        tree[letter][:losses] += 1
      end
      p "Tree: #{tree}"
    end
    calc_balance = {}
    tree.each { |letter, value| calc_balance[letter] = value[:wins] - value[:losses] }
    winning_moves = calc_balance.select { |letter, balance| balance >= calc_balance.values.max }.keys
    # p winning_moves

    random_win = rand(winning_moves.size)
    return winning_moves[random_win] 
  end

end