class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key] << key
    self.count += 1
    resize! if count >= num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self.count -= 1
      self[key].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |key| insert(key) }
  end
end
