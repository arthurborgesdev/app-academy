def my_map(array, &prc)
  my_array = []
  array.each { |elem| my_array << prc.call(elem) }

  my_array
end

def my_select(array, &prc)
  my_array = []
  array.each { |elem| my_array << elem if prc.call(elem) == true }
   
  my_array
end

def my_count(array, &prc)
  count = 0

  array.each { |elem| count += 1 if prc.call(elem) == true }
  count
end

def my_any?(array, &prc)
  count = 0

  array.each { |elem| count += 1 if prc.call(elem) == true }
  count >= 1
end

def my_all?(array, &prc)
  count = 0

  array.each {|elem| count += 1 if prc.call(elem) == true}
  count == array.length
end

def my_none?(array, &prc)
  count = 0

  array.each {|elem| count += 1 if prc.call(elem) == true}
  count == 0
end