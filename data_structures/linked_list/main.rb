# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

li = LinkedList.new
li.append(1)
li.prepend(0.5)
li.append(2)
li.prepend(34)
li.append(3)

puts li
p li.size
puts li.at(li.size - 1)
li.pop
puts li
p li.contains?(2)
p li.find_index(2)
