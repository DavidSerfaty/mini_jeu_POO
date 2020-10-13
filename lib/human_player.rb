class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name) #classe spécifique à un joueur humain
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state #ajout de l'affichage weapon level par rapport à player
    "Tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage #modification du calcul de dommages avec le weapon level
    rand(1..6) * weapon_level
  end

  def search_weapon #nouvelle fonction pour trouver une arme avec un meilleur niveau
    find_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{find_weapon}"
    if find_weapon > @weapon_level
      @weapon_level = find_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack #nouvelle fonction pour se remettre de la vie
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack == 6
      @life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    else
      @life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    end
  end
end
