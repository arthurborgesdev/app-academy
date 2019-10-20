def reverser(string, &prc)
  prc.call(string.reverse)
end

def word_changer(sentence, &prc)
  sentence.split.map {|word| prc.call(word)}.join(' ')
end

def greater_proc_value(number, prc1, prc2)
  value1 = prc1.call(number)
  value2 = prc2.call(number)

  (value1 > value2 ? value1 : value2)
end

def and_selector(array, prc1, prc2)
  my_array = []

  array.each do |elem| 
    if prc1.call(elem) == true && prc2.call(elem) == true
      my_array << elem
    end
  end
  my_array
end

def alternating_mapper(array, prc1, prc2)
  array.each_with_index.map do |elem, index|
    (index.even? ? prc1.call(elem) : prc2.call(elem))
  end
end