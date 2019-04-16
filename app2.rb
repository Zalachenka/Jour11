require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = ["player1","player2"]


puts "What's your name ?"
main_player_name = gets.chomp
main_player = HumanPlayer.new("#{main_player_name}")
puts "Well well well, warrior #{main_player_name}, let us play a game.."
puts "======================="
puts "3,2,1...FIGHT !!!"
	while main_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
		main_player.attacks(player1)
		puts main_player.show_state
		puts "What do you want to do ?"
		puts "W : Look for a better weapon"
		puts "H : Look for a health pack"
		puts "Attack another player :"
		puts "1 -"
		puts " #{player1.show_state}"
		puts "2 -"
		puts " #{player2.show_state}"
		choice = gets.chomp
		if choice == "W"
			main_player.search_weapon
		elsif choice == "H"
			main_player.search_health_pack
		elsif choice == "1"
			main_player.attacks(player1)
		elsif choice == "2"
			main_player.attacks(player2)	
		end
		player1.attacks(main_player)
		puts main_player.show_state
		puts "What do you want to do ?"
		puts "W : Look for a better weapon"
		puts "H : Look for a health pack"
		puts "Attack another player :"
		puts "1" 
		puts player1.show_state
		puts "2"
		puts player2.show_state
		choice = gets.chomp
		if choice == "W"
			main_player.search_weapon
		elsif choice == "H"
			main_player.search_health_pack
		elsif choice == "1"
			main_player.attacks(player1)
		elsif choice == "2"
			main_player.attacks(player2)
		end
		main_player.attacks(player2)
		puts main_player.show_state
		puts "What do you want to do ?"
		puts "W : Look for a better weapon"
		puts "H : Look for a health pack"
		puts "Attack another player :"
		puts "1 -"
		puts " #{player1.show_state}"
		puts "2 -"
		puts " #{player2.show_state}"
		choice = gets.chomp
			if choice == "W"
				main_player.search_weapon
			elsif choice == "H"
				main_player.search_health_pack
			elsif choice == "1"
				main_player.attacks(player1)
			elsif choice == "2"
				main_player.attacks(player2)	
			end
		player2.attacks(main_player)
		puts main_player.show_state
		puts "What do you want to do ?"
		puts "W : Look for a better weapon"
		puts "H : Look for a health pack"
		puts "Attack another player :"
		puts "1 -"
		puts " #{player1.show_state}"
		puts "2 -"
		puts " #{player2.show_state}"
		choice = gets.chomp
			if choice == "W"
				main_player.search_weapon
			elsif choice == "H"
				main_player.search_health_pack
			elsif choice == "1"
				main_player.attacks(player1)
			elsif choice == "2"
				main_player.attacks(player2)	
			end
		if (player1.life_points == 0 && player2.life_points == 0) || main_player.life_points == 0
				break
		end
			
	end
	if main_player.life_points == 0
	puts "Sorry, you lose. Game over."
	elsif player1.life_points == 0 && player2.life_points == 0
	puts "Congratulations, you've won !"
	end

puts "======================="

binding.pry


