# frozen_string_literal: true

# Node creation
class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    puts "Value: #{value} Next Node: #{next_node.nil? ? 'nil' : next_node.value}"
  end
end
