require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    self.bucket(key).include?(key)
  end

  def set(key, val)    
    resize! if self.count >= num_buckets

    if self.include?(key)
      return self.bucket(key).update(key, val)
    else
      self.count += 1
      return self.bucket(key).append(key,val)
    end
  end

  def get(key)
    self.bucket(key).get(key)
  end

  def delete(key)
    if self.include?(key)
      self.count -= 1
      return self.bucket(key).remove(key)
    end
  end

  def each
    @store.each do |bucket|
      bucket.each { |node| yield [node.key, node.val] }
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    self.count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new } 
    
    old_store.each do |bucket|
      bucket.each { |node| set(node.key, node.val) }
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
