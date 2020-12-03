def sentence_swap(sentence, hash)
  sentence.split(" ").map { |word| hash.has_key?(word) ? hash[word] : word }. join " "
end

p sentence_swap('anything you can do I can do',
  'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
  'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
  'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'