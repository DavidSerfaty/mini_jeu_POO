class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10 #on initialise la vie de nos players à 10PV
  end

  def show_state # methode pour connaitre l'état de santé du joueur
    "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage #diminuer la vie du joueur
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !" #renvoyer un message particulier si il meurt (0PV)
    else
      show_state #renvoi à la méthode sur l'état de santé
    end
  end

  def attacks(player_attacked)
    puts ">>> #{@name} attaque #{player_attacked.name}"
    damage = compute_damage #initialisaton d'un nombre de dommage
    puts "il lui inflige #{damage} points de dommages"
    player_attacked.gets_damage(damage) #fait appel à la méthode gets_damage pour diminuer ls points de vie
  end

  def compute_damage #infliger un nombre de dommage entre 1 et 6
   return rand(1..6)
 end
end
