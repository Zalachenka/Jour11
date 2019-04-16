require "pry"

class Player
	@@all_players = []
	attr_accessor :name, :life_points

	def initialize(name) # sert à définir noms + PV
		@name = name
		@life_points = 10
		@@all_players << self
	end

	def show_state # sert à définir où en est le joueur niveau PV
		 if @life_points > 0
		 	puts "#{@name} has #{life_points} life points remaining."
		 else 
		 	puts "#{@name} has 0 life points remaining."
		 end
	end

	def gets_damage(damage) # le joueur est endommagé
		damage = damage.to_i
		@life_points = @life_points - damage

		if @life_points <= 0
			puts "#{@name} is dead."
		end	
	end

	def attacks(player) # combat entre joueurs
		x = compute_damage
		puts "#{@name} attacks #{player.name} !"
		puts "#{@name} inflicts #{x} damages to #{player.name} !"
		player.gets_damage(x)
	end

	def compute_damage # définit combien de dommages se font les joueurs
    return rand(1..6)
  	end

  	def real_fight # définit où en sont les joueurs après le combat
  		puts "Here's the state of both players:
  		#{self}"
  	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name) # sert à définir nom + PV + lvl de l'arme du joueur humain
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state # définit le nombre de PV et le lvl de l'arme du joueur humain
		 if @life_points > 0
		 	puts "#{@name} has #{life_points} life points remaining and a weapon level at #{weapon_level}."
		 else 
		 	puts "#{@name} has 0 life points remaining."
		 end
	end

	def compute_damage # définit le nombre de dommages que prend l'arme
    rand(1..6) * @weapon_level
  	end

  	def search_weapon # définit si le joueur trouve une meilleure arme ou non
  		new_weapon = rand(1..6)
  		puts "You found a new weapon level #{new_weapon}"
  		if new_weapon > @weapon_level
  			new_weapon = @weapon_level
  			puts "Yay ! A more powerful weapon"
  		else puts "I'm keeping my weapon then.."
  		end
  	end

  	def search_health_pack # définit si le joueur a trouvé un health pack ou non
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
