require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache

  attr_reader :max, :prc

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if map[key]
      node = map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  attr_reader :store, :map

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = self.prc.call(key)
    node = self.store.append(key, val)
    self.map[key] = node

    eject! if self.count > self.max
    val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key = node.key
    val = node.val
    node.remove
    self.map[key] = self.store.append(key,val)
  end

  def eject!
    node = self.store.first
    self.map.delete(node.key)
    node.remove    
  end
end
