# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

li = LinkedList.new
li.append(1)
li.prepend(0.5)
li.append(2)
li.prepend(42)
li.append(3)

puts li
p li.size
puts li.at(0)
puts li.at(-5)
puts li.at(-1)
puts li.at(4)
p li.at(5)
p li.at(-6)
li.pop
puts li
p li.contains?(2)
p li.find_index(2)
p li.size
puts li.at(3)
li.insert_at(-3, 500)
li.insert_at(-7, 123)
li.insert_at(-6, 123)
puts li
puts li.remove_at(-6)
puts li
