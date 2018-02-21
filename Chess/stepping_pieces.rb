module SteppingPiece
  def move_directions

    possible_dir = []
    current_pos = self.position

    move_diffs.each do |pos|
      new_pos = [pos[0] + current_pos[0], pos[1] + current_pos[1]]
      if valid_move?(new_pos)
        possible_dir << new_pos
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
