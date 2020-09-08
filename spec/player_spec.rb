require_relative '../lib/player'
require_relative '../lib/Board'

describe Player do 
  describe '#initialize' do 
    let(:player_x) { Player.new('Ceci', 'X') } 
    let(:board) { Board.new()} 
    let(:positions) { {
                   1 => [0, 0], 2 => [0, 1], 3 => [0, 2],
                   4 => [1, 0], 5 => [1, 1], 6 => [1, 2],
                   7 => [2, 0], 8 => [2, 1], 9 => [2, 2]
    } }
  end
end