def palindrome?(string)
  arr = string.split('')
  steps = string.size / 2
  inc = 0
  dec = string.size - 1
  while steps > 0
    if !(arr[inc] == arr[dec])
      return false
    end
    inc += 1
    dec -= 1
    steps -= 1
  end
  true
end

# p palindrome?("racecar")

def substrings(string)
  new_arr = []
  arr = []
  string_array = string.split('')
  
  out_idx = 0
  index = 0
  while out_idx < string_array.length
    while index < string_array.length
      # arr << string_array[index] if index == 0
      arr << arr[-1].to_s + string_array[index] 
      index += 1
    end
    new_arr += arr
    arr = []
    out_idx += 1
    index = out_idx
  end
  new_arr
end

def palindrome_substrings(string)
  substrings(string).select! {|elem| palindrome?(elem) && elem.length > 1}
end