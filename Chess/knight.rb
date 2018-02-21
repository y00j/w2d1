require_relative 'piece'
require_relative 'stepping_pieces'

class Knight < Piece
  include SteppingPiece

  def move_diffs
    [[1, 2], [-1, 2], [2, 1], [2, -1], [-1, -2], [1, -2], [-2, 1], [-2, -1]]
  end

  def moves
    move_directions
  end

end
