# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

# set is_sorted flag
# iterate through the array continuously until is_sorted is no longer false (the conditional below is not triggered)
# if first element is greater than second
#   - swap elements
#   - set flag to false since it will need to be sorted again
# return sorted array

def bubble_sort(arr)
  is_sorted = false
  until is_sorted
    is_sorted = true
    (0...arr.length - 1).each do |i|
      j = i + 1
      if arr[i] > arr[j]
        arr[i], arr[j] = arr[j], arr[i]
        is_sorted = false
      end
    end
  end
  arr
end

p bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]