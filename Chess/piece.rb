class Piece
  attr_writer :position
  def initialize(color, position, board)
    @color = color
    @position = position
    @board = board

  end


end
