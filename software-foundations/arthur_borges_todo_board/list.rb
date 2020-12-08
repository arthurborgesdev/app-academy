require './item'

class List
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
    width = 50
    p '-'.ljust(width - 1, '-')
    p ' '.ljust((width - label.length) / 2) + label.upcase + ' '.rjust((width - label.length) / 2)
    p '-'.ljust(width - 1, '-')
    p "Index | Item #{' '.rjust(23)} | Deadline  "
    p '-'.ljust(width - 1, '-')
    @items.each_with_index do |item, idx| 
      p "#{idx}     | #{item.title.ljust(28)} | #{item.deadline}" 
    end
    p '-'.ljust(width - 1, '-')
  end

  def print_full_item(index)
    if valid_index?(index)
      width = 50
      item = @items[index]
      p '-'.ljust(width - 1, '-')
      p "#{item.title} #{item.deadline.rjust(width - item.title.length)}"
      p "#{@items[index].description}"
      p '-'.ljust(width - 1, '-')
    end
  end

end