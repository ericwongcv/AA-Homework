# Exercise 3 - Map
# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class 
# (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, 
# a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set 
# method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check 
# whether a key currently exists!

# As always, test your code thoroughly to make sure all properties of maps are enforced.

class Map

    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |pair|
            return pair[1] = value if pair[0] == key
        end
        
        @map << [key, value]
    end

    def get(key)
        pair = @map.select { |pair| pair[0] == key }
        p pair[0][1]
    end

    def delete(key)
        value = get(key)
        @map.select! { |pair| pair[0] != key }
        value
    end

    def show
        p @map
    end

end

map = Map.new
map.set("name", "Rock")
map.set("age", 3)
map.set("location", "CA")
map.show
map.set("name", "Jimmy")
map.show
map.delete("age")
map.show
map.get("name")
