class Game < HumanPlayer
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @players_left = 10
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = Array.new
    super(name)
  end

  def start_enemies(numbers_enemies) #choisir le nombre d'ennemis au départ
    for i in 1..numbers_enemies
      enemies_in_sight << Player.new("joueur n°#{rand(1..999)}")
    end
  end

  def kill_player(player)
    if player.life_points <= 0
      enemies_in_sight.delete(player)
    end
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies_in_sight.any?
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{enemies_in_sight.length} bots à combattre"
    puts "#{@players_left} combattants en attente !" #affichage du nombre de combattants sur le banc en attente
  end

  def new_players_in_sight
    if @players_left == 0 # si il reste 0 ennemi en reserve faire rentrer 0 personne
      puts "Tous les joueurs sont déjà en vue"
    elsif @players_left == 1 # si il reste 1 ennemi en reserve, faire rentrer aléatoirement 1 ou 0 personne
      new_enemies = rand(1..6)
      if new_enemies >= 1 && new_enemies <= 4
        @enemies_in_sight << Player.new("joueur n°#{rand(1..999)}")
        puts "1 nouvel adversaire arrive"
        @players_left -= 1
      else
        "Aucun nouveau joueur adverse n'arrive à ce tour"
      end
    else # si il reste 2 ennemis ou plus en reserve, faire rentrer aléatoirement 2, 1 ou 0 personne
      new_enemies = rand(1..6)
      if new_enemies == 1
        for i in 1..2
          @enemies_in_sight << Player.new("joueur n°#{rand(1..999)}")
          @players_left -= 1
        end
        puts "2 nouveaux adversaires arrivent"
      elsif new_enemies >= 2 && new_enemies <= 4
        @enemies_in_sight << Player.new("joueur n°#{rand(1..999)}")
        puts "1 nouvel adversaire arrive"
        @players_left -= 1
      else
        puts "Aucun nouveau joueur adverse n'arrive à ce tour"
      end
    end
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "attaquer un joueur en vue :"
    enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        puts "#{enemies_in_sight.index(enemy)} - #{enemy.show_state}"
      end
    end
  end

  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon
    elsif choice == "s"
      @human_player.search_health_pack
    else
      puts "Je passe à l'attaque !"
      @human_player.attacks(enemies_in_sight[choice.to_i])
      kill_player(enemies_in_sight[choice.to_i])
      puts
    end
  end

  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    enemies_in_sight.each do |enemi|
      enemi.attacks(@human_player)
    end
  end

  def end
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end
