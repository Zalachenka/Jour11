require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "What's your name ?"
main_player_name = gets.chomp
main_player = HumanPlayer.new("#{main_player_name}")
binding.pry