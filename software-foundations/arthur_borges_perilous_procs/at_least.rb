def at_least?(array, n, &prc)
  quantity = 0
  array.each { |elem| quantity += 1 if prc.call(elem) }
  quantity >= n
end

p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }       # false
p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }     # false
p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }   # true
p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') } # true
p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }     # true
p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }       # false
p at_least?([false, false, false], 3) { |bool| bool }                              # false
p at_least?([false, true, true], 3) { |bool| bool }                                # false
p at_least?([true, true, true], 3) { |bool| bool }                                 # true
p at_least?([true, true, true, true], 3) { |bool| bool }                           # true