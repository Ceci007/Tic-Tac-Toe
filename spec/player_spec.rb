require_relative '../lib/player'
require_relative '../lib/board'

describe Player do 
  describe '#initialize' do 
    let(:player_x) { Player.new('Ceci', 'X') }
    let(:player_o) { Player.new('Marcos', 'O') }
    let(:board) { Board.new } 

    describe '#initialize' do 
      it "Creates a player_x instance" do 
        expect(player_x).to be_an_instance_of Player
      end 

      it "Creates a player_o instance" do 
        expect(player_o).to be_an_instance_of Player
      end
    end

    it "returns the player's name" do 
      expect(player_x.name).to eql('Ceci')
    end 

    it "retuns true if the position is not yet taken by player_x" do 
      expect(player_x.check_position?(1, board)).to eql(true)
    end 

    it "converts the hask key into x and y coordinates and returns the position on the board" do 
      xy_pos = 1
      expect(player_x.make_move(1, board)).to eql(board.move(xy_pos[0], xy_pos[1], 'X'))
    end

    it "return the other player's name" do
      expect(player_o.name).to eql('Marcos')
    end

    it "returns true if the position is not yet taken by player_o" do
      expect(player_o.check_position?(3, board)).to eql(true)
    end
  end
end