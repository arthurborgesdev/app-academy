def vowel_rotate(str)
  vowels = []
  str.each_char do |char|
    vowels << char if "aeiou".include?(char)
  end
  vowels.rotate!(-1)
  str.each_char.map do |char|
    "aeiou".include?(char) ? vowels.shift : char
  end.join
end

# Examples
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"