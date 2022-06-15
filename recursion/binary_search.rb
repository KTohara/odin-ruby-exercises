# frozen_string_literal: true

# Binary Search - should return the index of target in an array

# Psuedocode:
# base case: repeat until the (sub)array is size 0
#   calculate the midpoint of the current (sub)array.
#   return midpoint if target is midpoint
#   if target is less then mid, bsearch with array range from start of array to mid
#   else if target is greater than mid, bsearch with array range from mid + 1 to end of array
#   memoize recurive call and deal with edge case of target not being array

# NOTE: - array must be sorted for binary search to correctly find the target
def binary_search(arr, target)
  return nil if arr.empty?

  mid = arr.size / 2
  case target <=> arr[mid]
  when 0  # target == arr[mid]
    mid
  when -1 # target < arr[mid]
    binary_search(arr.take(mid), target)
  when 1  # target > arr[mid]
    memo = binary_search(arr.drop(mid + 1), target)
    memo.nil? ? nil : mid + 1 + memo
  end
end

arr = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

p binary_search(arr, 17)  # => 7
p binary_search(arr, 100) # => nil
