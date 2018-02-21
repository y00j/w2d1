require 'byebug'

require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'
require_relative 'nullpiece'
require_relative 'display'
# require_relative 'piece'



class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @the_null_piece = NullPiece.instance
    populate
  end

  def populate
    # debugger
    self[[0, 0]] = Rook.new(:yellow, [0, 0], self)
    self[[0, 1]] = Knight.new(:yellow, [0, 1], self)
    self[[0, 2]] = Bishop.new(:yellow, [0, 2], self)
    self[[0, 3]] = King.new(:yellow, [0, 3], self)
    self[[0, 4]] = Queen.new(:yellow, [0, 4], self)
    self[[0, 5]] = Bishop.new(:yellow, [0, 5], self)
    self[[0, 6]] = Knight.new(:yellow, [0, 6], self)
    self[[0, 7]] = Rook.new(:yellow, [0, 7], self)

    self[[7, 0]] = Rook.new(:white, [7, 0], self)
    self[[7, 1]] = Knight.new(:white, [7, 1], self)
    self[[7, 2]] = Bishop.new(:white, [7, 2], self)
    self[[7, 3]] = King.new(:white, [7, 3], self)
    self[[7, 4]] = Queen.new(:white, [7, 4], self)
    self[[7, 5]] = Bishop.new(:white, [7, 5], self)
    self[[7, 6]] = Knight.new(:white, [7, 6], self)
    self[[7, 7]] = Rook.new(:white, [7, 7], self)
    populate_rest_of_board
    #loop within a loop
  end

  def populate_rest_of_board
    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if i == 1
          self[[i, j]] = Pawn.new(:yellow, [i, j], self)
        elsif i == 6
          self[[i, j]] = Pawn.new(:white, [i, j], self)
        elsif el.nil?
          self[[i, j]] = @the_null_piece
        end
      end
    end
  end

  def [](pos)
    @grid[pos[0]][pos[-1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[-1]] = value
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].is_a? NullPiece
      raise "You cannot start there"
    end

    if self[end_pos].color == self[start_pos].color
      raise "YOU cannot kill your own piece"
    end

    poss_moves = self[start_pos].moves
    if poss_moves.include?(end_pos)
      self[start_pos].position = end_pos
      if self[end_pos] == @the_null_piece
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      else
        self[end_pos] = self[start_pos]
        self[start_pos] = @the_null_piece
      end
    else
      raise "You cannot move there!"
    end

    #does nullpiece need position? NO
  end

  def on_board?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end



end
