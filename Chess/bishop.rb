require_relative 'piece'

class Bishop < Piece

  def move_diffs
    [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  end

  def moves
    move_directions
  end
end
