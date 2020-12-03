def chain_map(n, *prc)
  i = 0
  acc = n
  while i < prc[0].length
    # p "prc: #{prc} "
    acc = prc[0][i].call(acc)
    i += 1
  end
  acc
end

add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

p chain_map(25, [add_5, half])          # 15.0
p chain_map(25, [half, add_5])          # 17.5
p chain_map(25, [add_5, half, square])  # 225
p chain_map(4, [square, half])          # 8
p chain_map(4, [half, square])          # 4