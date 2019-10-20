def scope(str)
  name = "Arthur"
  str.split("").each do |char|
    p name
  end
end


p scope("hello")