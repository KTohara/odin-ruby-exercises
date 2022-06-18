# frozen_string_literal: true

require_relative 'node'

# Handles nodes within list
class LinkedList
  attr_reader :head, :tail

  def initialize(value = nil)
    value || begin_list(value)
    @head = nil
    @tail = nil
  end

  # sets head and tail instance variables in the case that @head is nil
  # allows for empty LinkedList instances
  def begin_list(value)
    node = Node.new(value)
    @head = node
    @tail = node
  end

  # adds a new node containing value to the end of the list
  def append(value)
    return begin_list(value) if head.nil?

    node = Node.new(value)
    tail.next_node = node
    @tail = node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new(value)
    node.next_node = head
    @head = node
  end

  # returns the total number of nodes in the list
  def size
    count = 0
    current_node = head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  # returns the node at the given index
  # supports negative indexing
  def at(index)
    return nil if head.nil? || (index + size).negative?

    index += size if index.negative?
    current_node = head
    index.times { current_node = current_node.next_node }
    current_node
  end

  # removes the last element from the list
  def pop
    return nil if head.nil?

    current_node = head
    current_node = current_node.next_node until current_node.next_node == tail
    current_node.next_node = nil
    @tail = current_node
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = head
    until current_node.nil?
      return true if value == current_node.value

      current_node = current_node.next_node
    end
    false
  end

  # returns the index of the node containing value, or nil if not found.
  def find_index(value)
    index = 0
    current_node = head
    until current_node.nil?
      return index if value == current_node.value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  # inserts a new node with the provided value at the given index.
  # supports negative indexing
  def insert_at(index, value)
    return puts 'Index Error' if index > size || (index + size) < -1
    return prepend(value) if index.zero? || (index + size) == -1

    index = index >= 1 ? index - 1 : index

    insertion_node = at(index)
    child_node = insertion_node.next_node
    insertion_node.next_node = Node.new(value, child_node)
  end

  # removes the node at the given index.
  def remove_at(index)
    return puts 'Index Error' if at(index).nil?

    case at(index)
    when head
      @head = at(1)
    when tail
      pop
    else
      prev_node = at(index - 1)
      prev_node.next_node = at(index + 1)
    end
  end

  def to_s
    current_node = head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    puts 'nil'
  end
end
