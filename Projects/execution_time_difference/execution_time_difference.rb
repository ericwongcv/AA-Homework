require 'byebug'

# Given a list of integers find the smallest number in the list.

# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(array)
    smallest = false
    until smallest
        array.each do |num1|
            smallest = true

            array.each do |num2|
                next if num1 == num2
                smallest = false if num1 > num2
            end
            return num1 if smallest
        end
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

def new_my_min(array)
    min = array[0]

    array.each do |num|
        min = num if num < min
    end

    min
end

# p new_my_min(list)  # =>  -5


# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

# Example:

#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:

#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])


def largest_contiguous_subsum(list)
    sub_arrays = []

    list.each_with_index do |num1, i1|
        sub_array = [num1]

        (i1...list.length).each do |i2|
            sub_array = sub_array.dup

            if num1 == list[i2]
                sub_arrays << [num1] 
            else
                sub_array << list[i2]
                sub_arrays << sub_array
            end
        end
    end
    sub_arrays.map { |array| array.sum }.max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])


def new_largest_contiguous_subsum(list)
    largest_subsum = nil

    until list.empty?
        current_sum = 0

        list.each do |num|
            current_sum += num
            largest_subsum = current_sum if largest_subsum.nil? || current_sum > largest_subsum
        end
        list.shift
    end
    largest_subsum
end

# list = [5, 3, -7]
# p new_largest_contiguous_subsum(list) # => 8

# list = [2, 3, -6, 7, -6, 7]
# p new_largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p new_largest_contiguous_subsum(list) # => -1 (from [-1])
