def element_count(arr)
  count = Hash.new(0)
  arr.each {|k, _| count[k] += 1}
  count
end

def char_replace!(str, hash)
  index = 0
  while index < str.length
    str[index] = hash[str[index]] if hash.has_key?(str[index]) 
    index += 1
  end
  str
end

def product_inject(arr)
  arr.inject(1) {|memo, number| memo * number}
end