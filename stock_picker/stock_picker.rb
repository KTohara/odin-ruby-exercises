# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

# create new hash
# iterate through input array as substrings of numbers
# create k v pairs - profit as keys, indices of day as values
# sort stock hash by highest number key
# return highest number key

def stock_picker(arr)
  stock_picks = Hash.new(0)
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      profit = arr[j] - arr[i]
      stock_picks[profit] = [i, j]
    end
  end
  sorted_stocks = stock_picks.sort_by { |k, v| k }
  highest_profit = sorted_stocks.last.last
  
  puts "Buy on day #{highest_profit.first} at $#{'%.2f' % arr[highest_profit.first]}"
  puts "Sell on day #{highest_profit.last} at $#{'%.2f' % arr[highest_profit.last]}" 
  puts "Profit will be $#{'%.2f' % sorted_stocks.last.first}"
end

stock_picker([17,3,6,9,15,8,6,1,10])
# [1, 4] => $12 profit:

# Buy on day 1 at $3.00
# Sell on day 4 at $15.00
# Profit will be $12.00