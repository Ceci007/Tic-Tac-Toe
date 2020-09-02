#!/usr/bin/env ruby

# rubocop: disable Style/GlobalVars

$player_x = ''
$player_o = ''

def play
  instructions
  set_players
  9.times do |time|
    player = time.odd? ? $player_x : $player_o
    ask_move(player)
    make_input
  end
  set_draw
end

def instructions
  puts "\nWelcome to Tic Tac Toe Game!\n"\
  "\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n"\
  "\nJust input your names and pick a number to place your mark"\
  ' until one of you TIC TAC TOE!!!'
end

def set_players
  puts "\nPlayer X name:"
  $player_x = gets.chomp
  puts "\nPlayer O name:"
  $player_o = gets.chomp
end

def ask_move(player)
  puts "\nMake your move #{player}!"
  puts "\nYou can select a number between 1 and 9"
  puts "\n   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"
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

def show_winner(player)
  puts "\nYou win #{player}!!!"
  puts "\n   |   |   \n-----------\n   |   |   \n-----------\n   |   |   \n"
  puts "\nGame Over."
end

def set_draw
  puts "\nThe game is draw!"
  puts "\n X | O | X \n-----------\n O | X | O \n-----------\n O | X | O \n"
  puts "\nGame Over."
end

play

# rubocop: enable Style/GlobalVars
