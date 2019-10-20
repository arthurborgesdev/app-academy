class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end
    
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_') 
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    array = []
    @secret_word.split('').each_with_index {|elem, index| array << index if char == elem}
    array
  end

  def fill_indices(char, array_of_indices)
    array_of_indices.each {|indice| @guess_word[indice] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    
    attempted_chars << char
    array_of_indices = self.get_matching_indices(char)
    self.fill_indices(char, array_of_indices)
    @remaining_incorrect_guesses -= 1 if array_of_indices.empty?
    true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
end
