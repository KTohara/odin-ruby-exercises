# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

# set abc to an array from a - z
# turn str into an array, and start inject with an empty array
# if the current char is not an alphabetical char
#   - inject it into the caesar array, and skip to next iteration
# find the index of current character, check for case, add the number of shifts, and modulo by 26 to make sure it wraps around
# if the ciphered character is an uppercase, inject as uppercase, else inject as lowercase

def caesar_cipher(str, shift = 0) 
  abc = ("a".."z").to_a
  str.split("").inject([]) do |cipher, char| 
    next cipher << char unless abc.include?(char.downcase)
    new_index = (abc.index(char.downcase) + shift) % abc.length
    char == char.upcase ? cipher << abc[new_index].upcase : cipher << abc[new_index]
  end.join
end

p caesar_cipher("What a string!", 5)
#  "Bmfy f xywnsl!"