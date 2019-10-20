require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    rooms = {}
    hash.each {|key, value| rooms[key] = Room.new(value)}
    @rooms = rooms
  end

  def name
    name_capitalized = @name.split(' ').map {|word| word.capitalize }.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.key?(room_name)
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        p 'check in successful'
      else
        p 'sorry, room is full'
      end
    else
      p 'sorry, room does not exist' 
    end
  end
  
  def has_vacancy?
    @rooms.values.any? {|room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each {|name, occupant| puts "#{name} : #{occupant.available_space}" }
  end
end
