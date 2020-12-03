def duos(str)
  count = 0
  str.each_char.with_index { |char, idx| count += 1 if str[idx] == str[idx + 1] }
  count
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0