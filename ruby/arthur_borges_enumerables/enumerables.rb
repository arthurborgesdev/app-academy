class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_array = []
    self.my_each { |elem| new_array << elem if prc.call(elem) }
    new_array
  end

  def my_reject(&prc)
    new_array = []
    self.my_each { |elem| new_array << elem unless prc.call(elem) }
    new_array
  end

  def my_any?(&prc)
    self.my_each do |elem|
      return true if prc.call(elem)
    end
    false
  end

  def my_all?(&prc)
    count = 0
    self.my_each do |elem|
      count += 1 if prc.call(elem)
    end
    count == self.length
  end

  def my_flatten
    flattened = []

    self.my_each do |elem| 
      if elem.is_a?(Array)
        flattened.concat(elem.my_flatten)
      else
        flattened << elem
      end
    end
    flattened
  end

  def my_zip(*args)
    zipped_array = []
    self.each.with_index do |elem, idx|
      inner_array = []
      inner_array << elem
      i = 0
      # p args
      while i < args.length
        # p args[i][idx]
        inner_array << args[i][idx]
        i += 1
      end
      zipped_array << inner_array
    end
    zipped_array
  end

  def my_rotate(num = 1)
    new_array = Array.new(self)
    if num > 0 
      num.times { |n| new_array.push(new_array.shift) }
    else
      (-num).times { |n| new_array.unshift(new_array.pop) }
    end
    new_array
  end

  def my_join(separator = "")
    join = ""
    self.my_each do |char|
      temp = char + separator
      join += temp
    end
    separator == "" ? join : join.chop
  end

  def my_reverse
    new_array = []
    self.my_each { |elem| new_array.unshift(elem) }
    new_array
  end
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

puts 

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

puts 

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

puts 

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

puts 

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

puts 

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

puts

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

puts 

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

puts

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]