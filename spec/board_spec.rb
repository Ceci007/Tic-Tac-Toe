require_relative '../lib/player'
require_relative '../lib/board'

describe Board do
  let(:player_x) { Player.new('Ceci', 'X') }
  let(:player_o) { Player.new('Marcos', 'O') }
  let(:board) { Board.new }

  describe %(#initialize) do
    it %(Creates a board instance) do
      expect(board).to be_an_instance_of Board
    end

    it %(Reads the instance variable @winner successfully) do
      expect(board.winner).to eql(false)
    end
  end

  describe %(#current_board) do
    it %(returns the board slots empty) do
      expect(board.current_board).to eql("\n   |   |   \n----------- \n   |   |   \n----------- \n   |   |   \n")
    end
  end

  describe %(#move) do
    it %(marks pos[1][1] with an X on the board) do
      board.move(1, 1, 'X')
      expect(board.current_board).to eql("\n   |   |   \n----------- \n   | X |   \n----------- \n   |   |   \n")
    end

    it %(marks pos[0][2] with an O on the board) do
      board.move(0, 2, 'O')
      expect(board.current_board).to eql("\n   |   | O \n----------- \n   |   |   \n----------- \n   |   |   \n")
    end
  end

  describe %(#check_winner) do
    it %(Checks if there is a winner on the row) do
      board.move(0, 0, 'X')
      board.move(0, 1, 'X')
      board.move(0, 2, 'X')
      expect(board.check_winner(0, 1, 'X')).not_to eql(false)
    end

    it %(Checks if there is a winner on the col 0) do
      board.move(0, 1, 'O')
      board.move(1, 1, 'O')
      board.move(2, 1, 'O')
      expect(board.check_winner(0, 1, 'O')).not_to eql(false)
    end

    it %(Checks if there is a winner on the first diagonal) do
      board.move(0, 0, 'O')
      board.move(1, 1, 'O')
      board.move(2, 2, 'O')
      expect(board.check_winner(0, 0, 'O')).not_to eql(false)
    end

    it %(Checks if there is a winner on the second diagonal) do
      board.move(0, 2, 'X')
      board.move(1, 1, 'X')
      board.move(2, 0, 'X')
      expect(board.check_winner(0, 2, 'X')).not_to eql(false)
    end

    it %(Checks if there is a draw) do
      board.move(0, 0, 'O')
      board.move(0, 1, 'X')
      board.move(0, 2, 'O')
      board.move(1, 0, 'X')
      board.move(1, 1, 'X')
      board.move(1, 2, 'O')
      board.move(2, 0, 'X')
      board.move(2, 1, 'O')
      board.move(2, 2, 'X')
      expect(board.check_winner(0, 0, 'O')).not_to eql(true)
    end
  end

  describe %(#reset) do
    it %(Reset the psoitions array) do
      board.reset
      expect(board.positions).to eql([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end

    it %(Reset the move number to zero) do
      board.reset
      expect(board.move_number).to eql(0)
    end

    it %(Reset the winner to false) do
      board.reset
      expect(board.winner).to eql(false)
    end
  end

  describe %(#empty_position?) do
    it %(returns true if the position is empty) do
      board.move(0, 0, ' ')
      xy_pos = 1
      expect(board.empty_position?(xy_pos[0], xy_pos[1])).to eql(true)
    end

    it %(returns false if the position is already taken) do
      board.move(0, 0, 'O')
      expect(board.empty_position?(0, 0)).to eql(false)
    end
  end
end
