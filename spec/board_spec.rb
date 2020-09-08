require_relative '../lib/player'
require_relative '../lib/board'

describe do Board 
  let(:player_x) { Player.new('Ceci', 'X') }
  let(:player_o) { Player.new('Marcos', 'O') }
  let(:board) { Board.new } 

  describe "#initialize" do 
    it "Creates a board instance" do 
      expect(board).to be_an_instance_of Board
    end 

    it "Reads the instance variable @winner successfully" do 
      expect(board.winner).to eql(false)
    end
  end

  describe "#current_board" do
    it "returns the board slots empty" do
      expect(board.current_board).to eql("\n   |   |   \n----------- \n   |   |   \n----------- \n   |   |   \n")
    end
  end

  describe "#move" do
    it "marks pos[1][1] with an X on the board" do
      board.move(1, 1, 'X')
      expect(board.current_board).to eql("\n   |   |   \n----------- \n   | X |   \n----------- \n   |   |   \n")
    end

    it "marks pos[0][2] with an O on the board" do 
      board.move(0, 2, 'O')
      expect(board.current_board).to eql("\n   |   | O \n----------- \n   |   |   \n----------- \n   |   |   \n")
    end
  end 

  describe "#check_winner" do 
    it "Checks if there is a winner on the row" do 
      board.move(0, 0, 'X')
      board.move(0, 1, 'X')
      board.move(0, 2, 'X')
      expect(board.check_winner(0, 1, 'X')).not_to eql(false)
    end

    it "Checks if there is a winner on the col 0" do
      board.move(0, 1, 'O')
      board.move(1, 1, 'O')
      board.move(2, 1, 'O')
      expect(board.check_winner(0, 1, 'O')).not_to eql(false)
    end

    it "Checks if there is a winner on the first diagonal" do
      board.move(0, 0, 'O')
      board.move(1, 1, 'O')
      board.move(2, 2, 'O')
      expect(board.check_winner(0, 1, 'O')).not_to eql(false)
    end

    it "Checks if there is a winner on the second diagonal" do
      board.move(0, 2, 'X')
      board.move(1, 1, 'X')
      board.move(2, 0, 'X')
      expect(board.check_winner(0, 1, 'X')).not_to eql(false)
    end
  end
end
