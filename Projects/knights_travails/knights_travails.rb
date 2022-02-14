require_relative "../PolyTreeNode/skeleton/lib/00_tree_node.rb"
require 'byebug'

class KnightPathFinder

    attr_reader :start_pos

    attr_accessor :considered_positions, :root_node

    MOVES = [[-1, 2], [1, 2], [-1, -2], [1, -2] , [-2, 1], [-2, -1], [2, 1], [2, -1]]

    def initialize(start_pos)     # pos value as array ex [0,0]
        @start_pos = start_pos
        @considered_positions = [start_pos]

        build_move_tree
    end

    def self.valid_moves(pos)
        move_set = MOVES.map { |move| [pos[0] + move[0], pos[1] + move[1]] } 
        move_set.select { |dx, dy| dx.between?(0, 7) && dy.between?(0, 7) }
    end

    def new_move_positions(pos)    #KnightPathFinder.valid_moves is class method. Must modify 
        KnightPathFinder.valid_moves(pos)
        .reject { |pos| considered_positions.include?(pos) }
        .each do |pos| 
            considered_positions << pos
        end
    end

    # def new_move_positions(pos)
    #   KnightPathFinder.valid_moves(pos)
    #     .reject { |new_pos| considered_positions.include?(new_pos) }
    #     .each { |new_pos| considered_positions << new_pos }
    # end

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)

        queue = [root_node]

        until queue.empty?
            first_node = queue.shift
            first_val = first_node.value

            new_move_positions(first_val).each do |next_val|
                next_node = PolyTreeNode.new(next_val)
                first_node.add_child(next_node)
                queue << next_node
            end
        end
    end

    def find_path(end_pos)
        last_node = root_node.bfs(end_pos)

        trace_path_back(last_node).map(&:value).reverse
    end

    def trace_path_back(end_node)
        nodes = []

        current_node = end_node
        until current_node.nil?  # at root node, will be nil
            nodes << current_node
            current_node = current_node.parent
        end
        nodes
    end

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6])
end


# kpf = KnightPathFinder.new([0, 0])
# # p KnightPathFinder.valid_moves([1,0])
# p kpf.new_move_positions([0,0])
# kpf.build_move_tree
# kpf.find_path([7,7])