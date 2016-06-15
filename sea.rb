class Sea

attr_reader(:players, :range, :possible_ranges)

  def initialize(players)

  @players = players
  @range = 2
  @possible_ranges = ["fire alongside", "fire close", "fire mid", "fire long", "fire extreme"]

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

  def change_player()
    @players.rotate![0]
  end

  def check_moves( player1, player2, player1_move , player2_move)
      move(player1_move) if player1_move == :retreat || :approach
      move(player2_move) if player2_move == :retreat || :approach

      player1.ship.repair if player1_move == :repair
      player2.ship.repair if player2_move == :repair
      
      player2.ship.shoot(player1_move,@possible_ranges[@range]) if player1_move != :retreat || :approach || :repair
      player1.ship.shoot(player2_move,@possible_ranges[@range]) if player2_move != :retreat || :approach || :repair
  end






end
