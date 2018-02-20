require 'colorize'
require_relative "cursor"
require_relative "board"

PIECES = {
  "Knight" => :N,
  "King" => :K,
  "Queen" => :Q,
  "Bishop"
}

class Display
  def initialize(board = Board.new)
    @cursor_pos = Cursor.new([0, 0], board)
    @board = board
  end

  def render

  end


end
