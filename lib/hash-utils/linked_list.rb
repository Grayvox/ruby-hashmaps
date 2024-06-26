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

  def find(key, node = @head)
    return node.value if key == node.key
    return nil if node.next_node.nil?

    find(key, node.next_node)
  end

  def to_s(string = '', node = @head)
    return nil if @head.nil?

    string += "( #{node.value} ) -> "
    return string += 'nil' if node.next_node.nil?

    to_s(string, node.next_node)
  end

  def remove_at(key, previous_node = nil, current_node = @head)
    return nil if current_node.nil?
    return @head = @head.next_node if @head.key == key

    return previous_node.next_node = current_node.next_node if current_node.key == key

    remove_at(key, current_node, current_node.next_node)
  end
end
