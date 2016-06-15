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

  def choose(choice)
    case choice
    when 1
      return :approach
    when 2
      return :retreat
    when 3
      return :alongside
    when 4
      return :close
    when 5
      return :mid
    when 6
      return :far
    when 7
      return :extreme
    else
      return :repair
    end
  end
end