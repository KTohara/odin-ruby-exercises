# frozen_string_literal: true

# Creates a binary tree for nodes to reside in, and handles node traversal
class Tree
  attr_reader :root

  def initialize(array)
    data = array.uniq.sort
    @root = build_tree(data)
  end

  # takes an array into a balanced binary tree full of node instances appropriately placed
  # should return the level-0 root node
  def build_tree(array)
    return nil if array.empty?

    mid = array.length / 2
    root = Node.new(array[mid])
    root.left = build_tree(array.take(mid))
    root.right = build_tree(array.drop(mid + 1))
    root
  end

  # inserts a node into the correct position
  def insert(value, node = @root)
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

    node.left.nil? ? node : find_min(node.left)
  end

  # returns leaf node with the maximal value of the input node
  def find_max(node = @root)
    return if node.nil?

    node.right.nil? ? node : find_max(node.right)
  end

  # returns the node with the corresponding value
  # returns nil if node does not exist
  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  # breadth first search (BFS) traversal:
  # level by level until the queue is empty, dequeue element, starting with root node
  # enqueue any existing left and right child nodes (unless nil/leaf node)
  # push the nodes into the output
  # return output after loop
  def level_order(&prc)
    q = [@root]
    output = []
    until q.empty?
      current_node = q.shift
      q << current_node.left unless current_node.left.nil?
      q << current_node.right unless current_node.right.nil?
      prc.call(current_node) if block_given?
      output << current_node.data
    end
    output
  end

  # left, root, right depth first search (DFS) traversal
  def inorder(node = @root, output = [], &prc)
    return output if node.nil?

    inorder(node.left, output, &prc)
    prc.call(node) if block_given?
    output << node.data
    inorder(node.right, output, &prc)
    output
  end

  # root, left, right DFS traversal
  def preorder(node = @root, output = [], &prc)
    return output if node.nil?

    prc.call(node) if block_given?
    output << node.data
    preorder(node.left, output, &prc)
    preorder(node.right, output, &prc)
    output
  end

  # left, right, root DFS traversal
  def postorder(node = @root, output = [], &prc)
    return output if node.nil?

    postorder(node.left, output, &prc)
    postorder(node.right, output, &prc)
    prc.call(node) if block_given?
    output << node.data
    output
  end

  # maximum depth, root node will be level 0
  def height(node = @root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    1 + [left_height, right_height].max
  end

  # depth from root node to specific node, root will be level 0
  def depth(node = @root)
    root_height = height(root)
    root_height - height(node)
  end

  # checks for tree balance
  # difference between height of left sub-tree and right sub-tree must be no more than 1
  def balanced?(node = @root)
    return true if node.nil?

    left = height(node.left)
    right = height(node.right)
    (left - right).abs <= 1
  end

  # re-balances a tree by taking a traversal method, and calling #build_tree
  def rebalance
    data = inorder
    @root = build_tree(data)
  end

  # display binary tree, shared by a TOP student
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
