# frozen_string_literal: true

class Tree
  def initialize(array)
    data = array.uniq.sort
    @root = build_tree(data)
  end

  # takes an array into a balanced binary tree full of node instances appropriately placed.
  # should return the level-0 root node.
  def build_tree(array)
    return nil if array.empty?

    mid = array.length / 2
    root = Node.new(array[mid])
    root.left = build_tree(array.take(mid))
    root.right = build_tree(array.drop(mid + 1))
    root
  end

  # Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not). If you need additional resources, check out these two articles on inserting and deleting, or this video with several visual examples.

  # inserts a node into the correct position
  # returns nil if value exists
  def insert(value)

  end

  # deletes a node with the corresponding value
  def delete(value)

  end

  # returns the node with the corresponding value
  # returns nil if node does not exist
  def find(value)

  end

  def level_order(&prc)

  end

  def inorder(&prc)

  end

  def preorder(&prc)

  end

  def postorder(&prc)

  end

  def height(node)

  end

  def depth(node)

  end

  def balanced?

  end

  def rebalance

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
