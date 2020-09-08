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
end
