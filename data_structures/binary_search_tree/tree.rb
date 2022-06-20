# frozen_string_literal: true
require 'byebug'

class Tree
  attr_reader :root

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

  # inserts a node into the correct position
  # returns nil if value exists
  def insert(value, node = @root)
    # return nil if value == node.data
    return Node.new(value) if node.nil?
    
    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    node
  end

  # deletes a node with the corresponding value
  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # delete with one or no child node
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # delete with two child nodes
      min_value_child = find_min(node.right)
      node.data = min_value_child.data
      node.right = delete(min_value_child.data, node.right)
    end
    node
  end

  # returns leaf node with the minimal value of the input node
  def find_min(node = @root)
    return if node.nil?
    return node.left.nil? ? node : find_min(node.left)
  end
  
  # returns leaf node with the maximal value of the input node
  def find_max(node = @root)
    return if node.nil?
    return node.right.nil? ? node : find_max(node.right)
  end

  # returns the node with the corresponding value
  # returns nil if node does not exist
  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
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

  # display binary tree, shared by TOP student
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
