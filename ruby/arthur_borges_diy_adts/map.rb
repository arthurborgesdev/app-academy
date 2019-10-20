class Map

  attr_accessor :ivar

  def initialize
    @ivar = []
  end

  def set(key, value)
    ivar.each do |elem|
      if elem[0] == key
        return elem[1] = value
      end
    end
    ivar.push([key, value])
  end

  def get(key)
    ivar.each do |elem| 
      return elem if elem[0] == key
    end
  end

  def delete(key)
    ivar.each_with_index do |elem, index| 
      ivar.delete_at(index) if elem[0] == key
    end
  end

  def show
    ivar
  end

end

map = Map.new

map.set("Arthur", 30)
map.set("Andressa", 29)
map.set("Arthur", 31)
map.delete("Andressa")
p map.show