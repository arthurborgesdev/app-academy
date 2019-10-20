class Stack

  attr_accessor :ivar

  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def push(el)
    # adds an element to the stack
    ivar.push(el)
  end

  def pop
    # removes one element from the stack
    ivar.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    ivar[-1]
  end
end

stack = Stack.new
stack.push(1)
stack.push("ele")
stack.pop
stack.push(2)
p stack.peek
p stack.ivar