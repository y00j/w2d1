require_relative 'piece'

class Pawn < Piece

  def moves
    possible_moves = []
    # if self.color == :white && self.position[0] == 6
    curr_position = self.position
    white_move_diffs = [[-1, 1], [1, 1], [0, 1], [0, 2]]
    black_move_diffs = [[1, -1], [-1, -1], [0, -1], [0, -2]]

    possible_moves = self.color == :white ? white_move_diffs : black_move_diffs
    new_positions = []
    possible_moves.each do |poss|
      new_positions << [curr_position[0] + poss[0], curr_position[1] + poss[1]]
    end

    final_positions = []

    if board[new_positions[0]].color != self.color && board[new_positions[0]].color == :none
      final_positions << new_positions[0]
    end

    if board[possible_moves[1]].color == self.color || board[possible_moves[1]].color == :none
      possible_moves = possible_moves[0] + possible_moves[2..-1]
    end
    if self.position

  end

end
