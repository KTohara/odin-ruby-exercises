# frozen_string_literal: true

class Node
  # include Comparable
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  # def <=>(other)
  #   value = other.instance_of?(Node) ? other.data : other
  #   value <=> data
  # end

  def to_s
    "Data: #{data} Left: #{left.nil? ? 'nil' : left.data} Right: #{right.nil? ? 'nil' : right.data}"
  end
end
