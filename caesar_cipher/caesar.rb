# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

def caesar_cipher(str, shift = 0) # set default value of shift to zero, if no number is entered
  # set abc to an array from a - z
  abc = ("a".."z").to_a

  str.split("").inject([]) do |caesar, char| # turn str into an array, and start inject with an empty array
    # if the current char is not an alphabetical char, inject it into the caesar array, and skip to next iteration
    next caesar << char unless abc.include?(char.downcase)

    # find the index of current character, check for case, add the number of shifts, and modulo by 26 to make sure it wraps around
    new_index = (abc.index(char.downcase) + shift) % abc.length

    # if the ciphered character is an uppercase, inject as uppercase, else inject as lowercase
    char == char.upcase ? caesar << abc[new_index].upcase : caesar << abc[new_index]
  end.join # join the array back as a string
end

p caesar_cipher("What a string!", 5)
#  "Bmfy f xywnsl!"