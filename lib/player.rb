require "pry"

class Player
	@@all_players = []
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
		@@all_players << self
	end

	def show_state
		 if @life_points > 0
		 	puts "#{@name} has #{life_points} life points remaining."
		 else 
		 	puts "#{@name} has 0 life points remaining."
		 end
	end

	def gets_damage(damage)
		damage = damage.to_i
		@life_points = @life_points - damage

		if @life_points <= 0
			puts "#{@name} is dead."
		end	
	end

	def attacks(player)
		x = compute_damage
		puts "#{@name} attacks #{player.name} !"
		puts "#{@name} inflicts #{x} damages to #{player.name} !"
		player.gets_damage(x)
	end

	def compute_damage
    return rand(1..6)
  	end

  	def real_fight
  		puts "Here's the state of both players:
  		#{self}"
  	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		 if @life_points > 0
		 	puts "#{@name} has #{life_points} life points remaining and a weapon level at #{weapon_level}."
		 else 
		 	puts "#{@name} has 0 life points remaining."
		 end
	end

	def compute_damage
    rand(1..6) * @weapon_level
  	end

  	def search_weapon
  		new_weapon = rand(1..6)
  		puts "You found a new weapon level #{new_weapon}"
  		if new_weapon > @weapon_level
  			new_weapon = @weapon_level
  			puts "Yay ! A more powerful weapon"
  		else puts "I'm keeping my weapon then.."
  		end
  	end

  	def search_health_pack
  		health_pack = rand(1..6)
  		if health_pack == 1
  			puts "You found nothing.."
  		elsif 2 << health_pack << 5 && life_points < 100
  			life_points + 50
  			puts "Yay ! You found a 50+ points life pack."
  		else health_pack == 6 && life_points < 100
  			life_points + 80
  			puts "Yay ! You found a 80+ points life pack."
  		end
  	end
end
