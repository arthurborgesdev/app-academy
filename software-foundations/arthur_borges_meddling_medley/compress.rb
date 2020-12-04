# new way -> Don't work because of last test case: All keys are grouped in hash
=begin
def compress(string)
  # convert("bbbb")
  count = Hash.new(0)
  string.split("").each { |char| count[char] += 1 }
  result = []
  count.map do |letter, number| 
    number > 1 ? result << letter + number.to_s : result << letter
  end
  result.join ""
end
=end 

def compress(string)
  grouped = group(string)
  grouped.map { |group| convert(group) }.join
end

def group(string)
  new_group = []
  part = []
  i = 0
  while i < string.length
    part << string[i]
    unless string[i] == string[i + 1]
      # part << string[i + 1]
      new_group << part.join
      part = []
    end
    i += 1
  end 
  new_group
end

def convert(sequence)
  sequence.length > 1 ? sequence[0] + sequence.length.to_s : sequence[0]
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"