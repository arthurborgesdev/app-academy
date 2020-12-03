def proctition_platinum(array, *prc)
  hash = Hash.new { |hash, key| hash[key] = Array.new }
  (1..prc.length).each { |num| hash[num] = Array.new }
  # hash[1] << "when"
  # hash
  (0...prc.length).each do |num| 
    # p "array: #{array}"
    array.each_with_index do |elem, idx| 
      if prc[num].call(elem)
        hash[num + 1] << elem
        array[idx] = "0"
      end
    end
    # p "hash: #{hash}"
    array.delete("0")
  end
  hash
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}