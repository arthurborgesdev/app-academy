class String
  def select(&prc)
    prc ? 
      self.each_char.map do |char| 
        prc.call(char) ? char : ""
      end.join 
      : ""
  end
end

# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""