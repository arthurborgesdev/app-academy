def triangular_word?(word)
  encoded_num = encode(word)
  i = 0 
  while i < encoded_num
    # p "encoded_num: #{encoded_num}"
    # p "(i * (i + 1)) / 2: #{(i * (i + 1)) / 2}"
    return true if encoded_num == (i * (i + 1)) / 2
    i += 1
  end
  false
end

def encode(word)
  alpha = ("a".."z").to_a
  word.split("").inject(0) do |memo, char| 
    # p "memo: #{memo}"
    # p "alpha.index(char): #{alpha.index(char)}"
    memo + alpha.index(char) + 1 # to comply with zero-based array index
  end
end

def triangular_number?(num)
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

