# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

my_list = LinkedList.new
my_list.append(1)
my_list.prepend(0.5)
my_list.append(2)
my_list.prepend(42)
my_list.append(3)

puts my_list
p my_list.size
puts my_list.at(0)
puts my_list.at(-5)
puts my_list.at(-1)
puts my_list.at(4)
p my_list.at(5)
p my_list.at(-6)
my_list.pop
puts my_list
p my_list.contains?(2)
p my_list.find_index(2)
p my_list.size
puts my_list.at(3)
my_list.insert_at(-3, 500)
my_list.insert_at(-7, 123)
my_list.insert_at(-6, 123)
puts my_list
puts my_list.remove_at(-1)
puts my_list
