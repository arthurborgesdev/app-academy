def vigenere_cipher(message, keys)
  alpha = ('a'..'z').to_a
  cycled_keys = keys.cycle((message.length / keys.length.to_f).round).to_a
  index = 0
  ciphered_message = []
  message.each_char do |char|
    ciphered_message << alpha[(alpha.index(char) + cycled_keys[index]) % 26]
    index += 1
  end
  ciphered_message.join
end


# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"