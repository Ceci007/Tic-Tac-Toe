#!/usr/bin/env ruby

$player_x = ''
$player_o = ''

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
