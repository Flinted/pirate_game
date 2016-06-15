class Dice

  def initialize
    @rolls = rand(1..10)  
  end

  def roll
    return @rolls
  end
end