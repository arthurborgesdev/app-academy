def silly_talk(sentence)
  sentence.split(" ").map do |word| 
    if "aeiou".include?(word[-1])
      vowel_end(word)
    else
      consonant_end(word)
    end
  end.join " "
end

def vowel_end(word)
  word + word[-1] if "aeiou".include?(word[-1]) 
end

def consonant_end(word)
  new_word = []
  i = 0
  while i < word.length
    "aeiouAEIOU".include?(word[i]) ? 
      if word[i] == word[i].upcase
        new_word << word[i] + 'b' + word[i].downcase 
      else
        new_word << word[i] + 'b' + word[i]
      end
    : new_word << word[i]
    i += 1
  end
  new_word.join ""
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"