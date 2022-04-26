def substrings(str, arr)
  subs = Hash.new(0)
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      key = str[i..j].downcase
      subs[key] += 1 if arr.include?(key)
    end
  end
  subs
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
# { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary)
# { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }