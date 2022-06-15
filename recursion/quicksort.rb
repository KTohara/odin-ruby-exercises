# frozen_string_literal: true

# Quick Sort: Sort the array in order from smallest to largest

# Pseudocode:
# base case: repeat until the size of the (sub)array is less than 1 (nothing left to search)
#   declare a pivot point as a element to be compared to in the method (can be any element)
#   compare all elements of the array to the pivot, except for the pivot itself
#   split the array into two subarrays:
#     array with elements less than the pivot
#     array with elements greater than the pivot
#   recursively call quicksort to the left and right, and add the pivot back into the sorted array

def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr.first # arbitrary pivot point. can be any element in the array

  less_than = arr[1..-1].select { |el| el < pivot }
  greater_than = arr[1..-1].select { |el| el > pivot }
  quicksort(less_than) + [pivot] + quicksort(greater_than)
end

arr = [14, 76, 49, 15, 19, 52, 63, 11, 39, 21]
p quicksort(arr)

# quick sort as an Array method, with optional block
class Array
  def my_quicksort(&prc)
    prc ||= proc { |a, b| a <=> b }
    return self if self.length <= 1

    pivot = self.last # again, arbitrary pivot point: chose last element this time

    # used the spaceship operator so we don't need multiple conditions
    left, right = self[0..-2].partition { |el| prc.call(el, pivot) == -1 }
    left.my_quicksort(&prc) + [pivot] + right.my_quicksort(&prc)
  end
end

arr = [14, 76, 52.93, 15, -19, 52, 63, 2022, 0, 39, 21]
p arr.my_quicksort
p arr.my_quicksort { |a, b| b <=> a }