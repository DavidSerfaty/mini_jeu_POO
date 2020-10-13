require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/game2'


puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Choisis un Pseudo de guerrier"
player_name = gets.chomp
my_game = Game.new(player_name)
puts "Combien veux-tu d'adversaires ? (sachant que 10 autres vont rentrer dans le game après)"
numbers_enemies = gets.chomp.to_i
my_game.start_enemies(numbers_enemies) #appel methode dans game2

while my_game.is_still_ongoing? #appel methode dans game2
  puts "--------------------------------"
  puts
  my_game.show_players #appel methode dans game2
  puts "-------"
  my_game.menu #appel methode dans game2
  choice = gets.chomp.to_s
  puts "-------"
  my_game.menu_choice(choice) #appel methode dans game2
  puts "-------"
  my_game.enemies_attack #appel methode dans game2
  puts "-------"
  my_game.new_players_in_sight #appel methode dans game2
  puts
  puts "--------------------------------"
end
my_game.end #appel methode dans game2
