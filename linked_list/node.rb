# frozen_string_literal: true

class Node
  attr_reader :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    next_node = 'Head' if next_node.nil?
    "#{value} #{next_node}"
  end
end
