class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def initialize(title, deadline, description)
    raise "The deadline date is invalid!" unless Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def self.valid_date?(date_string)
    splited = date_string.split("-")
    month = splited[1].to_i
    day = splited[2].to_i
    month >= 1 && month <= 12 && day >= 1 && day <= 31
  end

  def deadline=(new_deadline)
    raise "The deadline date is invalid!" unless Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end

  def toggle 
    @done = !@done
  end

end