def triplet_true(str)
  i = 0
  group = []
  content = []
  while i < str.length + 1 # Hack to iterate through all the letters
    # p "i: #{i}"
    # p "str[i]: #{str[i]} = str[i + 1]: #{str[i + 1]}"
    if str[i] == str[i + 1]
      content << str[i]
    else
      content << str[i]
      group << content
      content = []
    end
    i += 1 
  end
  group.any? {|content| content.length >= 3}
end

p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false