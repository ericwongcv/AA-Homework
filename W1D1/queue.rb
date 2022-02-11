# Exercise 2 - Queue
# Now let's write a Queue class. We will need the following instance methods: enqueue(el), dequeue, and peek.

# Test your code to ensure it follows the principle of FIFO.

class Queue

    attr_reader :queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue[-1]
    end

end

new_queue = Queue.new
p new_queue.enqueue(1)
p new_queue.enqueue(2)
p new_queue.enqueue(3)
p new_queue.peek
new_queue.dequeue
p new_queue.queue
new_queue.dequeue
p new_queue.queue