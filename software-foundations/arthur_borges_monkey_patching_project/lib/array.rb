# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
  def span
    if numbers_in_array?
      self.max - self.min
    end
  end

  def numbers_in_array?
    self.any? {|elem| elem.is_a?(Numeric) }
  end

  def average
    if numbers_in_array?
      self.sum / self.length.to_f
    end
  end

  def median
    odd = proc(&:odd?)
    even = proc(&:even?)

    case self.length
    when 0
      return nil
    when odd
      return self.sort[self.length/2]
    when even
      sorted = self.sort
      return (sorted[self.length/2 - 1] + sorted[self.length/2])/2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|elem| hash[elem] += 1}
    hash
  end

  def my_count(value)
    counts[value]
  end

  def my_index(value)
    self.each_with_index do |elem, index| 
      if elem == value 
        return index
      end
    end
    nil
  end

  def my_uniq
    count = Hash.new(0)
    self.each {|elem| count[elem] += 1}
    new_array = []
    count.each {|key, _| new_array << key }
    new_array
  end

  def my_transpose
    transposed = Array.new(self.length) { Array.new(self.length) }
    self.each_with_index do |line, i| 
      self[i].each_with_index do |elem, j|
        if i == j
          transposed[i][j] = elem 
        else
          transposed[i][j] = self[j][i]
        end
      end
    end
    transposed
  end
end
