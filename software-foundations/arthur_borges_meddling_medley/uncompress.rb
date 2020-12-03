def uncompress(string)
  uncompressed = ""
  i = 0
  while i < string.length - 1
    uncompressed = uncompressed + string[i] * string[i + 1].to_i
    i += 2
  end
  p uncompressed
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'