class Player
  
  attr_reader(:name, :wins, :ship)

  def initialize(name, ship)
    @name = name
    @ship = ship
    @wins = 0

  end

  def add_win()
    @wins += 1
  end

end