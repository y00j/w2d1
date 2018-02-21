require_relative 'piece'
require_relative 'sliding_piece'
class Rook < Piece
  include SlidingPiece

  def move_diffs
    [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end

  def moves
    move_directions
  end

end
