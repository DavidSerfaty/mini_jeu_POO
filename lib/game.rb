class Game < HumanPlayer
  attr_accessor :human_player, :enemies

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = Array.new
    super(name)
    for i in 1..4 # creation auto de 4 nouveaux ennemis
      enemies << Player.new("Enemy#{i}")
    end
  end

  def kill_player(player) #methode pour supprimer un joueur du jeux
    if player.life_points <= 0
      enemies.delete(player)
    end
  end

  def is_still_ongoing? #condition de jeu globale
    @human_player.life_points > 0 && @enemies.any?
  end

  def show_players #Le nombre de joueurs à combattre
    puts @human_player.show_state
    puts "Il reste #{enemies.length} bots à combattre"
  end

  def menu #Affichage du menu d'actions à effectuer
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts
    puts "attaquer un joueur en vue :"
    enemies.each do |enemy|
      if enemy.life_points > 0
        puts "#{enemies.index(enemy)} - #{enemy.show_state}"
      end
    end
  end

  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon #essayes d'ameliorer son arme grace à la méthode dans human player
    elsif choice == "s"
      @human_player.search_health_pack #essayes de récupérer de la vie grace à la méthode dans human player
    else
      puts "Je passe à l'attaque !"
      @human_player.attacks(enemies[choice.to_i]) #on choisi quel ennemis attaquer
      kill_player(enemies[choice.to_i])
      puts
    end
  end

  def enemies_attack #chaque ennemis attaquent l'humain
    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemi|
      enemi.attacks(@human_player) #cf methode player.rb
    end
  end

  def end #message de fin qui affiche si on a gagné ou perdu
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end
