require "byebug"

def longest_streak(str)
  # debugger
  return str if str.length == 1
  count = Hash.new(0)
  organize(str).each { |group| count[group] += group.length }
  count.select { |k, v| v == count.values.max }.keys.reverse.first.join('')
end

def organize(str)
  group = []
  inner_group = [] 
  str.each_char.with_index do |char, idx| 
    if str[idx] != str[idx + 1]
      inner_group << char
      group << inner_group
      inner_group = []
    else
      inner_group << char
    end
  end
  return group
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'