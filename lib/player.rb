
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    else
      show_state
    end
  end

  def attacks(player_attacked)
    puts ">>> #{@name} attaque #{player_attacked.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    player_attacked.gets_damage(damage)
  end

  def compute_damage
   return rand(1..6)
 end

end
