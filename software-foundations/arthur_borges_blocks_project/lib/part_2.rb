def all_words_capitalized?(array)
  array.all? { |word| capitalized?(word)}
end

def capitalized?(word)
  word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]
end

def no_valid_url?(array)
  array.none? {|url| valid_url?(url) }
end

def valid_url?(url)
  url.split(".")[-1] == "com" ||
  url.split(".")[-1] == "net" ||
  url.split(".")[-1] == "io" ||
  url.split(".")[-1] == "org"
end

def any_passing_students?(array)
  array.any? { |student| average_grade(student) >= 75 }
end

def average_grade(student)
  puts student[:grades]
  student[:grades].sum / student[:grades].length
end
