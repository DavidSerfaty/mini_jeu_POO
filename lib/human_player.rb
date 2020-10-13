class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    "Tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * weapon_level
  end

  def search_weapon
    find_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{find_weapon}"
    if find_weapon > @weapon_level
      @weapon_level = find_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack == 6
      if @life_points + 80 > 100
        @life_points = 100
      else
        @life_points += 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    else
      if @life_points + 50 > 100
        @life_points = 100
      else
        @life_points += 50
      end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    end
  end
end
