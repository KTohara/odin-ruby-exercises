# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

def substrings(str, arr)
  # create a new hash, with default value of 0
  subs = Hash.new(0)

  # iterate through the string and find all substrings
  # if substring key is included within the dictionary array, include it in the subs hash, and increase it's count by 1
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      key = str[i..j].downcase
      subs[key] += 1 if arr.include?(key)
    end
  end
  subs.sort.to_h # specifically added sort, to match TOP's outcome
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
# { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }