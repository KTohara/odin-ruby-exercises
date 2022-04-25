def caesar_cipher(str, shift = 0)
  abc = ("a".."z").to_a
  caesar = ""
  str.each_char do |char|
    unless abc.include?(char.downcase)
      caesar += char
      next
    end
    abc_index = abc.index(char.downcase)
    cipher = abc[(abc_index + shift) % abc.length]
    cipher = cipher.upcase if char == char.upcase
    caesar += cipher
  end
  caesar
end