require './item'
require 'byebug'

class List
  WIDTH = 50
  attr_accessor :label
  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description="")
    if Item.valid_date?(deadline)
      item = Item.new(title, deadline, description)
      @items << item
      return true
    else
      return false
    end
  end

  def size
    @items.size
  end

  def valid_index?(index)
    (0...@items.size).include?(index)
  end

  def swap(index_1, index_2)
    # debugger
    return false unless valid_index?(index_1) && valid_index?(index_2)
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end
  
  def [](index)
    @items[index]
  end

  def priority
    @items[0]
  end

  def print
    p '-'.ljust(WIDTH - 1, '-')
    p ' '.ljust((WIDTH - label.length) / 2) + label.upcase + ' '.rjust((WIDTH - label.length) / 2)
    p '-'.ljust(WIDTH - 1, '-')
    p "Index | Item #{' '.rjust(23)} | Deadline  "
    p '-'.ljust(WIDTH - 1, '-')
    @items.each_with_index do |item, idx| 
      p "#{idx}     | #{item.title.ljust(28)} | #{item.deadline}" 
    end
    p '-'.ljust(WIDTH - 1, '-')
    nil
  end

  def print_full_item(index)
    if valid_index?(index)
      item = @items[index]
      p '-'.ljust(WIDTH - 1, '-')
      p "#{item.title} #{item.deadline.rjust(WIDTH - item.title.length)}"
      p "#{@items[index].description}"
      p '-'.ljust(WIDTH - 1, '-')
    end
    nil
  end

  def print_priority
    p '-'.ljust(WIDTH - 1, '-')
    p "#{@items[0].title}"
    p "#{@items[0].deadline}"
    p "#{@items[0].description}"
    p '-'.ljust(WIDTH - 1, '-')
    nil
  end

  def up(index, amount = 1)
    idx = index
    amn = amount
    result = false
    while idx > 0 && amn > 0
      result = swap(idx, idx - 1)
      idx -= 1
      amn -= 1
    end
    result
  end

  def down(index, amount = 1)
    idx = index
    amn = amount
    result = false
    while idx < @items.length - 1 && amn > 0 
      result = swap(idx, idx + 1)
      amn -= 1
      idx += 1
    end
    result
  end
end