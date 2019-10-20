def select_even_nums(array)
  array.select(&:even?)
end

def reject_puppies(array)
  array.reject { |dog| dog["age"] <= 2 }

end

def count_positive_subarrays(array)
  array.count {|subarray| subarray.sum > 0}

end

def aba_translate(word)
  word.split('').map { |char| 
    if 'aeiou'.include?(char)
      char + 'b' + char
    else
      char
    end
  }.join('')
end

def aba_array(array)
  array.map { |word| aba_translate(word) }
end