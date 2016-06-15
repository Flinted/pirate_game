class Ship

  attr_reader(:name, :true, :holes, :afloat)

  def initialize(name)
    @name = name
    @holes = 0
    @afloat = true
  end

  def shoot(roll, range)
     return "HIT!" if roll == range 
     return "MISS!" if roll != range  
  end  

  def take_damage(hit_state)
   @holes += 1 if hit_state == "HIT!"
  end

  def check_ship_sunk()
    @afloat =false if @holes >= 5  
  end
  
end
