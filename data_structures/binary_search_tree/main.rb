# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 103, 2132, 151, -15, 23]
tree = Tree.new(array)
tree.pretty_print
node1 = Node.new(15)
node2 = Node.new(120)
puts node1 <=> node2
