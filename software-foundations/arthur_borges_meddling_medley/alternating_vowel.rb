def alternating_vowel(sentence)
  sentence.split(" ").map.with_index do |word, idx|
    if has_vowel(word)
      # p word
      idx.even? ? remove_first_vowel(word) : remove_last_vowel(word)
    else
      word
    end
  end.join " "
end

def remove_first_vowel(word)
  new_word = word.split("")
  i = 0
  while i < new_word.length
    if "aeiou".include?(new_word[i])
      new_word[i] = "0"
      break
    end 
    i += 1
  end
  new_word.delete("0")
  new_word.join
end

def remove_last_vowel(word)
  new_word = word.split("")
  i = new_word.length - 1
  while i > 0
    if "aeiou".include?(new_word[i])
      new_word[i] = "0"
      break
    end
    i -= 1
  end
  # p new_word
  new_word.delete("0")
  new_word.join
end

def has_vowel(word)
  word.include?("a") || word.include?("e") || word.include?("i") || word.include?("o") || word.include?("u")
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"