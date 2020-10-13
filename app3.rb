require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/game'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts
puts "Choisis un Pseudo de guerrier"


player_name = gets.chomp
my_game = Game.new(player_name) #création d'un nouveau game

while my_game.is_still_ongoing? #appel methode dans game
  puts "--------------------------------"
  puts
  my_game.show_players #appel methode dans game
  puts "-------"
  my_game.menu
  choice = gets.chomp.to_s
  puts "-------"
  my_game.menu_choice(choice) #appel methode dans game
  puts "-------"
  my_game.enemies_attack #appel methode dans game
  puts
  puts "--------------------------------"
end
my_game.end
