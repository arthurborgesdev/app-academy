def convert_pig_latin(sentence)
  new_sentence = []
  sentence.split(" ").map do |word| 
    if word.length < 3
      new_sentence << word
    elsif
      if "aeiouAEIOU".include?(word[0])
        new_sentence << word + "yay"
      else
        new_sentence << move_consonant(word) + "ay"
      end
    end
  end
  new_sentence.join " "
end

def move_consonant(word)
  word_array = word.split("")
  capital_letter = true if word[0] == word[0].upcase
  # puts word_array[0]
  until "aeiouAEIOU".include?(word_array[0])
    # puts "word_array: #{word_array}"
    word_array.push(word_array.shift)
  end
  capital_letter ? word_array.join("").capitalize : word_array.join("")
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"