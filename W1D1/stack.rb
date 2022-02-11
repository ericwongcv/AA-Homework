# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:

#   class Stack
#     def initialize
#       # create ivar to store stack here!
#     end

#     def push(el)
#       # adds an element to the stack
#     end

#     def pop
#       # removes one element from the stack
#     end

#     def peek
#       # returns, but doesn't remove, the top element in the stack
#     end
#   end

# To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. 
# Remember, a stack follows the principle of LIFO!

class Stack

    attr_reader :stack

    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end

end

new_stack = Stack.new
p new_stack.push(1)
p new_stack.push(2)
p new_stack.push(3)
p new_stack.peek
new_stack.pop
p new_stack.stack