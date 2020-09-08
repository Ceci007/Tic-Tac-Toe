require_relative '../lib/player'
require_relative '../lib/board'

describe Player do 
  describe '#initialize' do 
    let(:player_x) { Player.new('Ceci', 'X') }
    let(:player_o) { Player.new('Marcos', 'O') }
    let(:board) { Board.new()} 
    let(:positions) { {
                   1 => [0, 0], 2 => [0, 1], 3 => [0, 2],
                   4 => [1, 0], 5 => [1, 1], 6 => [1, 2],
                   7 => [2, 0], 8 => [2, 1], 9 => [2, 2]
    } }

    it "returns the player's name" do 
      expect(player_x.name).to eql('Ceci')
    end 

    it "retuns true if the position is not yet taken" do 
      expect(player_x.check_position?(1, board)).to eql(true)
    end 

    it "converts the hask key into x and y coordinates and returns the position on the board" do 
      xy_pos = positions[1]
      expect(player_x.make_move(1, board)).to eql(board.move(xy_pos[0], xy_pos[1], 'X'))
    end

    it "return the player's name" do
      expect(player_o.name).to eql('Marcos')
    end

    it "returns true if the position is not yet taken" do
      expect(player_o.check_position?(3, board)).to eql(true)
    end
  end
end