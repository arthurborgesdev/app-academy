def reverberate(sentence)
  new_sentence = []
  sentence.split(" ").map do |word| 
    if word.length < 3
      new_sentence << word
    else
      if "aeiouAEIOU".include?(word[-1])
        new_sentence << word + word.downcase
      else
        new_sentence << word + repeat_last(word)
      end
    end
  end
  new_sentence.join " "
end

def repeat_last(word)
  i = word.length - 1
  complement = []
  until "aeiouAEIOU".include?(word[i])
    complement.unshift(word[i])
    i -= 1
  end
  complement.unshift(word[i])
  complement.join ""
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"