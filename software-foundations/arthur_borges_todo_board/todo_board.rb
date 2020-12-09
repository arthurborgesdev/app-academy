# require "byebug"
require './list.rb'

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    # debugger
    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')
    case cmd
    when "mktodo"
      @list.add_item(*args)
    when "up"
      args.map! { |elem| elem.to_i }
      @list.up(*args)
    when "down"
      args.map! { |elem| elem.to_i }
      @list.down(*args)
    when "swap"
      args.map! { |elem| elem.to_i }
      @list.swap(*args)
    when "sort"
      @list.sort_by_date!
    when "priority"
      @list.print_priority
    when "print"
      if args.empty? 
        @list.print 
      else
        args.map! { |elem| elem.to_i }
        @list.print_full_item(*args)
      end
    when "toggle"
      args.map! { |elem| elem.to_i }
      @list.toggle_item(*args)
    when "rm"
      args.map! { |elem| elem.to_i }
      @list.remove_item(*args)
    when "purge"
      @list.purge
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