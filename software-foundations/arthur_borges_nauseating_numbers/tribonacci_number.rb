def tribonacci_number(num)
  return 1 if num == 1
  return 1 if num == 2
  return 2 if num == 3

  return tribonacci_number(num - 3) + tribonacci_number(num - 2) + tribonacci_number(num - 1)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274