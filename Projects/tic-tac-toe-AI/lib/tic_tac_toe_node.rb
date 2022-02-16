require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode

  attr_reader :board
  attr_accessor :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)         # evaluator is mark x or o
    if board.over?
      return board.won? && board.winner != evaluator
    end

    if self.next_mover_mark == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end

  end

  # def losing_node?(evaluator)
  #   if board.over?
  #     return board.won? && board.winner != evaluator
  #   end

  #   if self.next_mover_mark == evaluator
  #     self.children.all? { |node| node.losing_node?(evaluator) }
  #   else
  #     self.children.any? { |node| node.losing_node?(evaluator) }
  #   end
  # end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    (0..2).each do |row_i|
      (0..2).each do |tile_i|
        
        pos = [row_i, tile_i]

        if board[pos].nil?
          next_board = board.dup
          next_board[pos] = self.next_mover_mark
          next_mover_mark = (self.next_mover_mark == :x ? :o : :x)

          next_node = TicTacToeNode.new(next_board, next_mover_mark, pos)
          next_node.prev_move_pos = pos
          children << next_node
        end
      end
    end

    children
  end
end
