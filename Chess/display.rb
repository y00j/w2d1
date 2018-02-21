require 'colorize'
require_relative "cursor"
# require_relative "board"
# require_relative "piece"
# require_relative "king"

PIECES = {
  Knight => :N,
  King => :K,
  Queen => :Q,
  Bishop => :B,
  Pawn => :P,
  Rook => :R,
  NullPiece => " "
}

class Display
  def initialize(board = Board.new)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system('clear')
    puts "________________________________________"
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        piece_name = piece.class
        color = " #{PIECES[piece_name].to_s.colorize(piece.color)} "
        if @cursor.cursor_pos == [i, j]
          color = " #{PIECES[piece_name]} ".colorize(:color => piece.color, :background => :red)
        end
        print "|#{color}|"
      end
      puts ""
      puts "________________________________________"
    end
    @cursor.get_input
    render
  end


end
