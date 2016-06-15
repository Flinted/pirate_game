class Ship

  attr_reader(:name, :holes, :afloat)

  def initialize(name)
    @name = name
    @holes = 0
    @afloat = true
  end

  def shoot(choice, range)
     take_damage() if choice == range 
      
  end  

  def take_damage()
   @holes += 1
  end

  def check_ship_sunk()
    @afloat = false if @holes >= 5  
    return @afloat
  end

  def repair
    @holes -= 1 if @holes > 0
  end
  
end
