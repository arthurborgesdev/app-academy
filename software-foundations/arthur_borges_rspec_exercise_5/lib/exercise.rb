def zip(*arr)
  arr.transpose
end

def prizz_proc(arr, prc1, prc2)
  arr.select { |elem| prc1.call(elem) ^ prc2.call(elem) }
end

def zany_zip(*arr)
  row_size = arr.length
  col_size = arr.map { |ar| ar.length }.max
  zipped_arr = Array.new(col_size) { Array.new(row_size) }
  i = 0
  j = 0
  while j < row_size
    while i < col_size
      begin
        zipped_arr[i][j] = arr[j][i]
      rescue => exception
      else
        zipped_arr[j][i] == nil ?  nil : zipped_arr[i][j] = arr[j][i]
      end
      # p "arr[j][i]: #{arr[j][i]}"
      # p arr
      # p "-----------"
      # p zipped_arr
      i += 1
    end
    i = 0
    j += 1
  end
  zipped_arr
end

def maximum(array, &prc)
  calc = Hash.new(0)
  array.map do |elem| 
    calc[elem] = prc.call(elem) 
  end
  begin
    calc.select { |k, v| v == calc.values.max }.to_a.last[0]
  rescue => exception
    return nil
  else
    calc.select { |k, v| v == calc.values.max }.to_a.last[0]
  end
end

def my_group_by(array, &prc)
  hash = Hash.new { Array.new }
  array.map { |elem| hash[prc.call(elem)] <<= elem }
  hash
end

def max_tie_breaker(array, prc1, &prc2)
  group = my_group_by(array, &prc2)
  group[group.keys.max][0]
end

def silly_syllables(sentence) 
  words = sentence.split(" ")
  
  w = 0
  while w < words.length
    l = 0
    word = words[w]
    if word.split("").count { |char| "aeiou".include?(char) } >= 2
      while l < word.length
        # p "Entrando"
        # p word[l]
        unless "aeiou".include?(word[l])
          # p "Dentro"
          # p words[w][l]
          # p "-----------------"
          word[l] = "0"
        else
          l += 1
          break
        end
        l += 1
        # p word[l]
      end
      l = word.length - 1
      while l > 0
        unless "aeiou".include?(word[l])
          word[l] = "0"
        else
          l -= 1
          break
        end
        l -= 1
      end
    end
    w += 1
  end
  words.map {|word| word.delete "0" }.join(" ")
end