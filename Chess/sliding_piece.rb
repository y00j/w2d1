module SlidingPiece

  def move_directions
    possible_dir = []
    current_pos = self.position
    move_diffs.each do |direction|
      next_pos = [direction[0] + current_pos[0], direction[1] + current_pos[1]]
      while valid_move?(next_pos)
        possible_dir << next_pos
        break if board[next_pos].color != self.color
        next_pos = [direction[0] + next_pos[0], direction[1] + next_pos[1]]
      end
    end

    possible_dir
  end

  def valid_move?(pos)
    curr_piece = board[pos]
    is_null_piece = curr_piece.is_a?(NullPiece)
    is_enemy_piece = curr_piece.color != self.color
    (is_null_piece || is_enemy_piece) && board.on_board?(pos)
  end

end
