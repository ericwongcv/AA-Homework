require_relative "../PolyTreeNode/skeleton/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :start_pos

    attr_accessor :considered_positions, :root_node

    MOVES = [[-1, 2], [1, 2], [-1, -2], [1, -2] , [-2, 1], [-2, -1], [2, 1], [2, -1]]

    def initialize(start_pos)     # pos value as array ex [0,0]
        @start_pos = start_pos
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos)
        move_set = MOVES.map { |move| [pos[0] + move[0], pos[1] + move[1]] } 
        move_set.select { |dx, dy| dx.between?(0, 7) && dy.between?(0, 7) }
    end

    def new_move_positions(pos)
        valid_pos_arr = KnightPathFinder.valid_moves(pos)
        filtered_pos = valid_pos_arr.select { |pos| !considered_positions.include?(pos) }
        considered_positions.concat(filtered_pos)
    end

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

    def find_path(target_pos)

    end

    def build_move_positions
        
    end


end


kpf = KnightPathFinder.new([0, 0])
# p KnightPathFinder.valid_moves([1,0])
# p kpf.new_move_positions()
p kpf.build_move_tree