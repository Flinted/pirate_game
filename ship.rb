class Ship

  attr_reader(:name, :holes, :afloat,:repair_count)

  def initialize(name)
    @name = name
    @holes = 0
    @afloat = true
    @repair_count = 0
  end

  def shoot(choice, range)
     take_damage() if choice == range 
  end  

  def take_damage()
   @holes += 1
  end

  def check_ship_sunk()
    @afloat = false if @holes >= 3  
    return @afloat
  end

  def repair
    
    @holes -= 1 if @holes > 0 &&  @repair_count < 3
    @repair_count += 1
  end
  
end
