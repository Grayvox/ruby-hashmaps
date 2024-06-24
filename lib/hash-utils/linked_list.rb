# frozen_string_literal: true

require_relative 'node'

# Defines the linked list itself
class LinkedList
  attr_accessor :head

  def intialize(head = nil)
    @head = head
  end

  def append(key, value)
    return @head = Node.new(key, value) if @head.nil?

    tail.next_node = Node.new(key, value)
  end

  def prepend(key, value)
    return @head = Node.new(key, value) if @head.nil?

    @head = Node.new(key, value, @head)
  end

  def size(node = @head, count = 0)
    return count if node.nil?

    count += 1
    size(node.next_node, count)
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def at(index, node = @head, current_index = 1)
    return node if index == current_index

    at(index, node.next_node, current_index + 1)
  end

  def pop(node = @head)
    return nil if @head.nil? || @head.next_node.nil?
    return node.next_node = nil if node.next_node.next_node.nil?

    pop(node.next_node)
  end

  def contains?(key, node = @head)
    return true if key == node.key
    return false if node.next_node.nil?

    contains?(key, node.next_node)
  end

  def find(key, node = @head, current_index = 1)
    return current_index if key == node.key
    return nil if node.next_node.nil?

    find(key, node.next_node, current_index + 1)
  end

  def to_s(string = '', node = @head)
    return nil if @head.nil?

    string += "( #{node.value} ) -> "
    return string += 'nil' if node.next_node.nil?

    to_s(string, node.next_node)
  end

  def insert_at(key, value, index)
    return prepend(key, value) if (index - 1) <= 0
    return append(key, value) if index > size

    previous_node = at(index - 1)
    new_node = Node.new(value, previous_node.next_node)
    previous_node.next_node = new_node
  end

  def remove_at(index)
    return nil if index < 1 || index > size

    node = at(index)
    previous_node = at(index - 1)
    previous_node.next_node = node.next_node
  end
end
