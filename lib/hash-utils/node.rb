# frozen_string_literal: true

# Defines a node in a linked list
class Node
  attr_reader :key
  attr_accessor :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end
