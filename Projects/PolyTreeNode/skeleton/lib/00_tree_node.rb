require "byebug"

# module Searchable
#     def dfs(target = nil, &prc)
#         raise "Need a proc or target" if [target, prc].none?
#         prc ||= Proc.new { |node| node.value == target }
    
#         return self if prc.call(self)
        
#         children.each do |child|
#           result = child.dfs(&prc)
#           return result unless result.nil?
#         end
    
#         nil
#     end

#        def bfs(target = nil, &prc)
#         raise "Need a proc or target" if [target, prc].none?
#         prc ||= Proc.new { |node| node.value == target }
    
#         nodes = [self]
#         until nodes.empty?
#           node = nodes.shift
    
#           return node if prc.call(node)
#           nodes.concat(node.children)
#         end
    
#         nil
#       end

# end

class PolyTreeNode
    # include Searchable

    attr_reader :parent, :value, :children
    
    def initialize(value = nil)
        @parent, @children, @value = nil, [], value
    end

    def parent=(node)
        @parent.children.delete(self) if @parent != nil
        @parent = node        

        return nil if @parent.nil?
        
        @parent.children << self unless @parent.children.include?(self)

    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise "not a child" if child_node.parent.nil?
    end

    def dfs(target_value)

        return self if @value == target_value

        @children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            first = queue.shift
            return first if first.value == target_value
            queue.concat(first.children)
        end
        nil
    end

end



# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []
# p n1.children