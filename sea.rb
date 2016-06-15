class Sea

attr_reader(:players, :range)

  def initialize(players)

  @players = players
  @range = 2
  @possible_ranges = [:alongside, :close, :mid, :far, :extreme]
  end

  def player_count
    return @players.size
  end

  def check_range
    return @possible_ranges[@range]
  end

  def move(direction)
    @range += 1 if direction == :retreat && @range < 4
    @range -= 1 if direction == :approach && @range > 0
    # collision() if @range == 1 && direction == :approach
  end






end
