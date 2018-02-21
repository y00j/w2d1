require_relative 'piece'
require_relative 'stepping_pieces'
# require_relative 'board'
# require_relative 'display'

class King < Piece
  include SteppingPiece

  def move_diffs
    [0, 1, -1, 1, -1].permutation(2).to_a.uniq
  end

  def moves
    move_directions
  end
end


# display = Display.new(board)

# display.render
#
# board.move_piece([4, 4], [5, 4])
# display.render
