#!/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/board'

def tic_tac_toe
  board = Board.new
  player_x = Player.new('', 'X')
  player_o = Player.new('', 'O')
  instructions
  set_players(player_x, player_o)
  again = true
  while again
    play(player_x, player_o, board)
    break unless again == ask_user("\nPlay again? (yes or no): ")

    set_players(player_x, player_o) if ask_user('Set players again? (yes or no): ')
    board.reset
  end
  puts "\nThank you for playing!"
end

def play(player_x, player_o, board)
  parity = rand(0..1).zero? ? :even? : :odd?
  9.times do |time|
    player = time.send(parity) ? player_x : player_o
    ask_move(player.name, board)
    player.make_move(make_input(player, board), board)
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
  ' until one of you TIC TAC TOE!!!'\
  "\n(Remember that turn order is assigned randomly)"
end

def ask_user(question)
  user_answer = []
  until user_answer.include?('yes') || user_answer.include?('no')
    print question
    user_answer << gets.chomp
  end
  user_answer.include?('yes') ? true : false
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
  puts board.current_board
end

def make_input(player, board)
  valid = false
  taken_message = 'The position is already taken. Try again with other position.'
  invalid_message = 'That input is invalid. Try again using a number between 1 and 9.'
  until valid
    input = gets.chomp.to_i
    if input.between?(1, 9) && player.check_position?(input, board)
      valid = true
    else
      message = input.between?(1, 9) ? taken_message : invalid_message
      puts message
    end
  end
  input
end

def show_winner(player, board)
  puts "\nYou win #{player}!!!"
  puts board.current_board
  puts "\nGame Over."
end

def show_draw(board)
  puts "\nThe game is draw!"
  puts board.current_board
  puts "\nGame Over."
end

tic_tac_toe
