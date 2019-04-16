require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Here is the state of the players:"
player1.show_state
player2.show_state 
puts "======================="
puts "Let's fight !"
	player1.attacks(player2)
	player2.attacks(player1)
puts "======================="
puts "Here's how our players are doing:"
player1.show_state
player2.show_state
puts "======================="
puts "Let's fight !"
while player1.life_points > 0 && player2.life_points > 0
	player1.attacks(player2)
	player2.attacks(player1)
	if player1.life_points == 0 || player2.life_points == 0
		break
	end
end

puts "======================="

binding.pry