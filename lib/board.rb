class Board
  attr_reader :winner
  def initialize
    @positions = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    @move_number = 0
    @winner = false
  end

  def show_board
    puts "\n #{@positions[0][0]} | #{@positions[0][1]} | #{@positions[0][2]} \n"\
     "----------- \n"\
     " #{@positions[1][0]} | #{@positions[1][1]} | #{@positions[1][2]} \n"\
     "----------- \n"\
     " #{@positions[2][0]} | #{@positions[2][1]} | #{@positions[2][2]} \n"
  end

  def move(x_pos, y_pos, mark)
    positions[x_pos][y_pos] = mark
    @move_number += 1
    check_winner(x_pos, y_pos, mark) if @move_number > 4
  end
end
