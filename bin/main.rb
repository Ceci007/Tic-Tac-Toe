#!/usr/bin/env ruby

class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
    @positions = { 1 => [0, 0], 2 => [0, 1], 3 => [0, 2],
                   4 => [1, 0], 5 => [1, 1], 6 => [1, 2],
                   7 => [2, 0], 8 => [2, 1], 9 => [2, 2] }
  end

  def make_move(position, board)
    board.move(@positions[position].push(@mark))
  end
end

class Board
  attr_reader :winner

  def initialize
    @positions = [['', '', ''], ['', '', ''], ['', '', '']]
    @move_number = 0
    @winner = false
  end

  def show_board
    puts "\n
    #{@positions[0][0]} | #{@positions[0][1]} | #{@positions[0][2]}
    \n--------------\n
    #{@positions[1][0]} | #{@positions[1][1]} | #{@positions[1][2]}
    \n--------------\n
    #{@positions[2][0]} | #{@positions[2][1]} | #{@positions[2][2]} "
  end

  def move(x_pos, y_pos, mark)
    @positions[x_pos][y_pos] = mark
    @move_number += 1
    check_winner if move_number > 4
  end

  def check_winner(x_pos, y_pos, mark)
    @winner = check_row(y_pos, mark)
    return @winner if @winner

    @winner = check_col(x_pos, mark)
    return @winner if @winner

    @winner = check_diagonal(x_pos, y_pos, mark) if x_pos == y_pos || (x_pos - y_pos).abs == 2
  end

  private

  def check_row(y_pos, mark)
    @positions[y_pos].all? { |i| i == mark }
  end

  def check_col(x_pos, mark)
    @positions.all? { |i| i[x_pos] == mark }
  end

  def check_diagonal(x_pos, y_pos, mark)
    if (x_pos - y_pos).abs == 2
      j = 2
      3.times do |i|
        return false unless @positions[i][j] == mark

        j -= 1
      end
      return true
    end
    3.times { |i| return false unless @positions[i][i] == mark }
    true
  end
end

class TicTacToe
  def initialize
    @board = Board.new
    @player_x = Player.new('', 'X')
    @player_o = Player.new('', 'O')
  end

  def play
    set_players
    instructions
    9.times do |time|
      player = time.odd? ? @player_x : @player_o
      player.make_move(ask_move(player.name), @board)
      if @board.winner
        show_winner(player.name)
        return nil
      end
    end
    set_draw
  end

  private

  def instructions
    puts "Welcome to Tic Tac Toe Game!\n"
    puts " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "
    puts "Just input your names and pick a number to place your mark
    \nuntil one of you TIC TAC TOE!!!"
  end

  def set_players
    puts 'Player X name:'
    @player_x.name = gets.chomp
    puts 'Player O name:'
    @player_o.name = gets.chomp
  end

  def ask_move(player)
    puts "Make your move #{player}!"
    @board.show_board
    gets.chomp.to_i
  end

  def show_winner(player)
    puts "You win #{player}!!!"
    @board.show_board
    puts 'Game Over.'
  end

  def set_draw
    puts "The game is draw!\nGame Over."
  end
end

game = TicTacToe.new
game.play
