def bubble_sort(array)
  return array if array == array.sort
  bubble_sort(one_sort(array))
end

def one_sort(array)
  (0...array.size - 1).each do |elem|
    if array[elem] > array[elem + 1]
      array[elem], array[elem + 1] = array[elem + 1], array[elem]
    end
  end
  array
end

p bubble_sort([2,8,5,2,6,1,2,3,6,4,7,1,1,3,5,1,2])
