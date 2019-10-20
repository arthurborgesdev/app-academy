class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? {|char| POSSIBLE_PEGS.key?(char.upcase)}
  end

  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map(&:upcase)
    else
      raise 'Array does not contain valid pegs'
    end
  end
  
  def pegs
    @pegs
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end
  
  def self.from_string(pegs)
    Code.new(Array.new(pegs.chars))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    (0...guess.length).each {|i| matches += 1 if guess[i] == self[i]}
    matches
  end

  def num_near_matches(guess)
    matches = 0
    (0...guess.length).each do |i| 
      if pegs.include?(guess[i]) && !(guess[i] == self[i])
        matches +=1 
      end
    end
    matches
  end

  def ==(code)
    code.pegs == self.pegs
  end
end
