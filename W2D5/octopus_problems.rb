# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"


fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishes)
    longest = ""
    (0...fishes.length - 1).each do |idx1|
        (idx1 + 1...fishes.length).each do |idx2|
            if fishes[idx1].length > fishes[idx2].length && fishes[idx1].length > longest.length
                longest = fishes[idx1]
            else
                longest = fishes[idx2]
            end
        end
    end
    longest
end

# p sluggish_octopus(fishes)


# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. 
# Remember that Big O is classified by the dominant term.

def dominant_octopus(fishes)
    return fishes[0] if fishes.length <= 1
    
    midpoint = (fishes.length / 2)

    left_half = fishes[0...midpoint]
    right_half = fishes[midpoint..fishes.length]
    left = dominant_octopus(left_half)
    right = dominant_octopus(right_half)
    return left.length > right.length ? left : right

end

# p dominant_octopus(fishes)


# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far 
# while stepping through the array only once.

def clever_octopus(fishes)
    largest_fish = ""

    fishes.each do |fish|
        largest_fish = fish if fish.length > largest_fish.length
    end

    largest_fish
end

# p clever_octopus(fishes)


# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's 
# eight tentacles are numbered and correspond to the tile direction indices.


# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.


def slow_dance(dir, tiles_array)
    tiles_array.each_with_index do |tile, i|
        return i if tile == dir
    end
end

# p slow_dance("up", tiles_array)
# # > 0

# p slow_dance("right-down", tiles_array)
# # > 3


# Constant Dance! (Fast Dance)
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function 
# so that you can access the tentacle number in O(1) time.


def fast_dance(dir, new_tiles_data_structure)
    new_tiles_data_structure[dir]
end

new_tiles_data_structure = {"up" => 0,  "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up"  => 7}


p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3