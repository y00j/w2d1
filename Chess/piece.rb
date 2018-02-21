class Piece
  attr_reader :color, :move_diffs, :board
  attr_accessor :position

  def initialize(color, position = nil, board = nil)
    @color = color
    @position = position
    @board = board
    @move_diffs = nil
  end

  def moves

  end


end
