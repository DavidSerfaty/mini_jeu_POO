require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Choisis un Pseudo de guerrier"

player_name = gets.chomp
user = HumanPlayer.new(player_name)

enemies = Array.new
enemies << enemy1 = Player.new("Chris")
enemies << enemy2 = Player.new("John")

while user.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
  puts user.show_state
  puts
  puts "Quelle action veux-tu effectuer ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
  enemies.each do |enemi|
    if enemi.life_points > 0
      puts "#{enemies.index(enemi)} - #{enemi.show_state}"
    end
  end
  play = gets.chomp
  if play == "a"
    user.search_weapon
  elsif play == "s"
    user.search_health_pack
  else
    user.attacks(enemies[play.to_i])
  end
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemi|
    if enemi.life_points > 0
      enemi.attacks(user)
    end
  end

end

puts "La partie est finie"

if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
