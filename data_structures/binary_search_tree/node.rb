# frozen_string_literal: true

# Single node/element within a binary search tree
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def to_s
    "Data: #{data} Left: #{left.nil? ? 'nil' : left.data} Right: #{right.nil? ? 'nil' : right.data}"
  end
end
