class Queue

  attr_accessor :ivar

  def initialize
    @ivar = []
  end
  
  def enqueue(el)
    ivar.unshift(el)
  end

  def dequeue
    ivar.pop
  end

  def peek
    ivar[-1]
  end
end

queue = Queue.new
queue.enqueue("Andressa")
queue.enqueue("Cleide")
queue.enqueue("Arthur")
p queue.ivar
p queue.peek