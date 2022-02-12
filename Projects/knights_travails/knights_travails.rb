require_relative "../PolyTreeNode/skeleton/lib/00_tree_node.rb"

class KnightPathFinder

    @@moves = [[-1, 2], [1, 2], [-1, -2], [1, -2] , [-2, 1], [-2, -1], [2, 1], [2, -1]]

    def initialize(pos)     # pos value as array ex [0,0]
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        @@moves.map { |move| [pos[0] + move[0], pos[1] + move[1]] } 
    end

    def new_move_positions(pos_arr)
        filtered_pos = pos_arr.select { |pos| !@considered_positions.include?(pos) }
        valid_pos_arr = self.valid_moves(filtered_pos)
        @considered_positions.concat(valid_pos_arr)
    end

    def build_move_tree
        queue = [@root_node]
    end

    def find_path(target_pos)

    end

    def build_move_positions
        
    end


end


kpf = KnightPathFinder.new([0, 0])
p KnightPathFinder.valid_moves([1,0])