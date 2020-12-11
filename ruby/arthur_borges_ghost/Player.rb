class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "Please say a letter, #{name}"
    input = gets.chomp
  end

  def alert_invalid_guess
    puts "You made a invalid guess! Try again"
  end
end