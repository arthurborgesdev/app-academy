def hipsterfy(word)
  index = word.length - 1
  while index > 0
    if "aeiou".include?(word[index])
      word[index] = ""
      return word
      break
    end
    index -= 1
  end
  word
end

def vowel_counts(str)
  hash = Hash.new(0)
  str.downcase.split("").each {|char| hash[char] += 1 if "aeiou".include?(char) }
  hash
end

def caesar_cipher(message, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  cipher = ""
  message.split("").each_with_index do |char, index|
    if alphabet.include?(char)
      new_index = alphabet.index(char) + n
      if new_index < 26
        cipher += alphabet[new_index]
      else
        cipher += alphabet[new_index % 26]
      end
    else
      cipher += char
    end
  end
  cipher
end
