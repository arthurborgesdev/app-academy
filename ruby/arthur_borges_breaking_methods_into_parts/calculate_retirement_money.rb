def return_number(a)
  ((a / 2)**2) * (65 - (a / 2))
end

def calculate_retirement_money(age)
  half_age = age / 2
  bank_account_estimative = half_age ** 2
  years_left_to_work = 65 - half_age
  bank_account_estimative * years_left_to_work
end

p calculate_retirement_money(30)
p calculate_retirement_money(50)