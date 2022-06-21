# frozen_string_literal: true

require_relative 'tree'
require_relative 'node'

# Driver script for BST

# Create a binary search tree from an array of random numbers
array = (Array.new(15) { rand(1..100) })
puts "Creating BST with #{array.length} elements."
bst = Tree.new(array)
puts
bst.pretty_print
puts
bst.rebalance
bst.pretty_print

# Confirm that the tree is balanced by calling #balanced?
puts bst.balanced? ? 'Tree is balanced' : 'Tree is NOT balanced'

# Print out all elements in level, pre, post, and in order
puts 'Level Order Traversal'
p bst.level_order
puts
puts 'Pre-order Traversal'
p bst.preorder
puts
puts 'Post-order Traversal'
p bst.postorder
puts
puts 'In-order Traversal'
p bst.inorder
puts

# Unbalance the tree by adding several numbers > 100
puts 'Unbalancing tree...'
bst.insert(101)
puts "Adding... #{bst.find_max}"
bst.insert(102)
puts "Adding... #{bst.find_max}"
bst.insert(103)
puts "Adding... #{bst.find_max}"
bst.insert(104)
puts "Adding... #{bst.find_max}"
puts

# Confirm that the tree is unbalanced by calling #balanced?
puts bst.balanced? ? 'Tree is balanced' : 'Tree is NOT balanced'
puts
bst.pretty_print
puts

# Balance the tree by calling #rebalance
puts 'Re-balancing tree...'
bst.rebalance
puts

# Confirm that the tree is unbalanced by calling #balanced?
puts bst.balanced? ? 'Tree is balanced' : 'Tree is NOT balanced'
puts
bst.pretty_print
puts

# Print out all elements in level, pre, post, and in order
puts 'Level Order Traversal'
p bst.level_order
puts
puts 'Pre-order Traversal'
p bst.preorder
puts
puts 'Post-order Traversal'
p bst.postorder
puts
puts 'In-order Traversal'
p bst.inorder
puts
