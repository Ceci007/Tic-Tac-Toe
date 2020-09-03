#!/usr/bin/env ruby

require './lib/player'
require './lib/board'

def play
  board = Board.new
  player_x = Player.new('', 'X')
  player_o = Player.new('', 'O')
  instructions
  set_players(player_x, player_o)
  9.times do |time|
    player = time.odd? ? player_x : player_o
    ask_move(player.name, board)
    player.make_move(make_input, board)
    if board.winner
      show_winner(player.name, board)
      return nil
    end
  end
  show_draw(board)
end

def instructions
  puts "\nWelcome to Tic Tac Toe Game!\n"\
  "\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n"\
  "\nJust input your names and pick a number to place your mark"\
  ' until one of you TIC TAC TOE!!!'
end

def set_players(player_x, player_o)
  puts "\nPlayer X name:"
  player_x.name = gets.chomp
  puts "\nPlayer O name:"
  player_o.name = gets.chomp
end

def ask_move(player, board)
  puts "\nMake your move #{player}!"
  puts "\nYou can select a number between 1 and 9"
  board.show_board
end

def make_input
  valid = false
  until valid
    input = gets.chomp.to_i
    if input.between?(1, 9)
      valid = true
    else
      puts 'That input is invalid. Try again using a number between 1 and 9.'
    end
  end
  input
end

def show_winner(player, board)
  puts "\nYou win #{player}!!!"
  board.show_board
  puts "\nGame Over."
end

def show_draw(board)
  puts "\nThe game is draw!"
  board.show_board
  puts "\nGame Over."
end

play
