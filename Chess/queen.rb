require_relative 'piece'

class Queen < Piece
  def move_diffs
    [[1, 1], [-1, 1], [-1, -1], [1, -1]] + [[0, 1], [1, 0], [-1, 0], [0, -1]]
  end

  def moves
    move_directions
  end
end
