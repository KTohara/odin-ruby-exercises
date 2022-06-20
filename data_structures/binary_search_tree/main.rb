# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

array = [1, 7, 8, 9, 10, 17, 18, 104, 23, 8, 9, 2132, 151, -15, 23]
tree = Tree.new(array)
# node1 = Node.new(15)
# node2 = Node.new(120)
# puts node1 <=> node2
tree.insert(-13)
puts tree.find_min
puts tree.find_max
tree.pretty_print
tree.delete(7)
tree.pretty_print
puts tree.find(17)