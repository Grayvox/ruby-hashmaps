# frozen_string_literal: true

require_relative 'hash-utils/linked_list'

# Defines the hashmap, which contains Linked lists, which contains nodes
class HashMap
  attr_accessor :capacity, :buckets

  def initialize(capacity = 16)
    @capacity = capacity
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = 31 * hash_code + char.ord }
    hash_code % capacity
  end

  def set(key, value)
    code = hash(key)
    return @buckets[code].append(key, value) unless @buckets[code].nil? || @buckets[code].contains?(key)

    @buckets[code] = LinkedList.new
    @buckets[code].append(key, value)
  end

  def get(key)
    @buckets.each do |list|
      next if list.nil?

      result = list.find(key)
      return result unless result.nil?
    end
    nil
  end

  def has?(key)
    @buckets.each do |list|
      next if list.nil?

      result = list.contains?(key)
      return result if result
    end
    false
  end
end
