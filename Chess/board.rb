require 'byebug'

require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'king'
require_relative 'queen'
require_relative 'pawn'
require_relative 'nullpiece'
# require_relative 'piece'



class Board
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate
  end

  def populate
    # debugger
    self[[0, 0]] = Rook.new(:black, [0, 0], self)
    self[[0, 1]] = Knight.new(:black, [0, 1], self)
    self[[0, 2]] = Bishop.new(:black, [0, 2], self)
    self[[0, 3]] = King.new(:black, [0, 3], self)
    self[[0, 4]] = Queen.new(:black, [0, 4], self)
    self[[0, 5]] = Bishop.new(:black, [0, 5], self)
    self[[0, 6]] = Knight.new(:black, [0, 6], self)
    self[[0, 7]] = Rook.new(:black, [0, 7], self)

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
          self[[i, j]] = Pawn.new(:black, [i, j], self)
        elsif i == 6
          self[[i, j]] = Pawn.new(:white, [i, j], self)
        elsif el.nil?
          self[[i, j]] = NullPiece.new(:none, [i, j], nil)
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

    if self[end_pos].class != NullPiece
      raise "The end square is already filled"
    end
    self[start_pos].position = end_pos
    self[end_pos].position = start_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]

    #does nullpiece need position?
  end

  def valid_pos?(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end



end
