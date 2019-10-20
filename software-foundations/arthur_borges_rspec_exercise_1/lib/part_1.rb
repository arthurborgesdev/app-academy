def average(num1, num2)
  (num1+num2)/2.0
end

def average_array(array)
  array.inject(0) {|sum, elem| sum + elem}/array.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  sentence
  .downcase
  .split
  .each_with_index
  .map { |word, index| (index.even? ? word.upcase : word) }
  .join(" ")
end