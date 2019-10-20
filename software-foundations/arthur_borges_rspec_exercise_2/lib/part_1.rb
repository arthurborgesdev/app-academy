def partition(array, number)
  parted = Array.new(2) {Array.new}
  while array.size > 0
    (array[0] < number ? parted[0] << array.delete_at(0) :
    parted[1] << array.delete_at(0) )
  end
  parted
end

def merge(hash1, hash2)
  hash = {}
  hash1.each {|k, v| hash[k] = v}
  hash2.each {|k, v| hash[k] = v}
  hash
end

def censor(sentence, array)
  sentence.split.map! { |word| 
    if bad_word?(word, array)
      censorize(word)
    else
      word
    end
  }.join(' ')
end

def bad_word?(word, array)
  array.any? {|bad| bad == word.downcase}
end

def censorize(word)
  word.split('').map { |char| 
    ("aeiou".include?(char.downcase) ? "*" : char)
  }.join('')
end

def power_of_two?(number)
  base = number
  while base > 2
    return false if !base.even?
    base = base/2
  end
  true
end