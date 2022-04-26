require 'byebug'

def caesar_cipher(str, shift = 0)
  abc = ("a".."z").to_a
  caesar = ""
  str.each_char do |char|
    unless abc.include?(char.downcase)
      caesar += char
      next
    end
    abc_index = (abc.index(char.downcase) + shift) % abc.length
    char == char.upcase ? caesar += abc[abc_index].upcase : caesar += abc[abc_index]
  end
  caesar
end

p caesar_cipher("What a string!", 5)
#  "Bmfy f xywnsl!"