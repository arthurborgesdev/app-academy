# require "byebug"
require './list.rb'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    # debugger
    print "\nEnter a command: "
    cmd, list_label, *args = gets.chomp.split(' ')
    case cmd
    when "mklist"
      @lists[list_label] = List.new(list_label)
    when "ls"
      @lists.each { |key, _| p key }
    when "showall"
      @lists.each { |label, list| list.print }
    when "mktodo"
      @lists[list_label].add_item(*args)
    when "up"
      args.map! { |elem| elem.to_i }
      @lists[list_label].up(*args)
    when "down"
      args.map! { |elem| elem.to_i }
      @lists[list_label].down(*args)
    when "swap"
      args.map! { |elem| elem.to_i }
      @lists[list_label].swap(*args)
    when "sort"
      @lists[list_label].sort_by_date!
    when "priority"
      @lists[list_label].print_priority
    when "print"
      if args.empty? 
        @lists[list_label].print 
      else
        args.map! { |elem| elem.to_i }
        @lists[list_label].print_full_item(*args)
      end
    when "toggle"
      args.map! { |elem| elem.to_i }
      @lists[list_label].toggle_item(*args)
    when "rm"
      args.map! { |elem| elem.to_i }
      @listS[list_label].remove_item(*args)
    when "purge"
      @lists[list_label].purge
    when "quit"
      return false
    else
      print "Sorry, that command is not recognized."
    end

    true
  end

  def run
    loop do
      break unless self.get_command
      # break if result == false
    end
  end

end

boards = TodoBoard.new
boards.run