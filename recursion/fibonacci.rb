# frozen_string_literal: true

# Using iteration, write a method #fibonnaci which takes a number and returns an array
# containing that many numbers from the fibonacci sequence. Using an example input of 8,
# this method should return the array [0, 1, 1, 2, 3, 5, 8, 13].

def fibonacci(num)
  (2...num).inject([0, 1]) { |fibs| fibs << fibs[-1] + fibs[-2] }
end

# Now write another method #fibs_rec which solves the same problem recursively.
# This can be done in just 3 lines (or 1 if you’re crazy, but don’t consider either of
# these lengths a requirement… just get it done).

def fibs_rec(num)
  # base case for 0, 1, 2
  return [0, 1].take(num) if num <= 2

  # memoize recursive call to optimize
  prev_fib = fibs_rec(num - 1)

  # push last two digits into the previous recursive call
  prev_fib << prev_fib[-1] + prev_fib[-2]
end

def fibs_one_line(num, result = [0, 1])
  num <= 2 ? result.take(num) : fibs_one_line(num - 1) << fibs_one_line(num - 1)[-1] + fibs_one_line(num - 1)[-2]
end

p fibonacci(10)     # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
p fibs_rec(10)      # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
p fibs_one_line(10) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]