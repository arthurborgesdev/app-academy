def energetic_encoding(string, hash)
  # p string.split("")
  string.split("").map do |char| 
    if hash.has_key?(char)
      hash[char]
    elsif char == ' '
      ' '
    else
      '?'
    end
  end.join("")
end

p energetic_encoding('sent sea',
  'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
  'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
  'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'