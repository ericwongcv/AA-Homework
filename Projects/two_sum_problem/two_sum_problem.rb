# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

# def two_sum?(arr, target_sum)
#     # your code here...
# end

# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false



# Brute force
# If we weren't worried about time complexity, what would be the most straightforward way to solve this problem? 
# To start with, we could check every possible pair. If we sum each element with every other, we're sure to either 
# find the pair that sums to the target, or determine that no such pair exists.

# This is the brute force solution. It's essentially hitting the problem with a sledge hammer. There are faster and more 
# elegant ways to solve the problem, but we know for sure that this will get the job done.

# Let's start by implementing the brute force solution. Write a method called bad_two_sum?, which checks every possible pair.

# Make sure that you don't pair an element with itself. However, you don't need to bother checking for summing the same pair twice; 
# that won't affect your result.

# (Note: you can cut the running-time significantly by returning early, and by not checking pairs more than once. However, these 
# micro-optimizations will not improve the time complexity of the solution. Do you see why?)

# Once you're done, write a comment with your solution's time complexity.



# O(n^2) time complexity
# O(1) space complexity

def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num, i1|
        (i1+1...arr.length).each do |i2|
            return true if num + arr[i2] == target_sum
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false



# Sorting
# As a person of elevated algorithmic sensibilities, the brute-force approach is beneath you. Leave that nonsense to the riffraff. 
# Instead, you'll apply a refined and time-honored technique: sorting.

# Sort your data, then try to solve the problem.

# What does sorting do to the lower bound of your time complexity?
# How might sorting that make the problem easier?
# Write a second solution, called okay_two_sum?, which uses sorting. Make sure it works correctly.

# Hint: (There are a couple ways to solve this problem once it's sorted. One way involves using a very cheap algorithm that can only be 
# used on sorted data sets. What are some such algorithms you know?)



# O(nlog(n)) time complexity
# O(n) space complexity

def okay_two_sum?(arr, target_sum)
    arr = arr.sort

    idx1, idx2 = 0, arr.length - 1

    while idx1 < idx2
        case arr[idx1] + arr[idx2] <=> target_sum
        when 0  
            return true
        when -1
            idx1 += 1
        when 1
            idx2 -= 1
        end
    end
    false
end

# arr = [0, 1, 5, 7, 7, 2, 1]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false



# Hash Map
# Finally, it's time to bust out the big guns: a hash map. Remember, a hash map has O(1) #set and O(1) #get, so you can build a hash out 
# of each of the n elements in your array in O(n) time. That hash map prevents you from having to repeatedly find values in the array; now 
# you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your solutions and then call over your TA and show them what you've got. 
# Defend to them why each of your solutions has the time complexity you claim it does.


def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |num|
        return true if hash[target_sum - num]
        hash[num] = true
    end
    false
end

# arr = [0, 1, 5, 7, 7, 2, 1]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false