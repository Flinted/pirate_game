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

  def change_player()
    @players.rotate![0]
  end

  def check_first_moves( player1, player2, player1_move , player2_move)
      player1.move(player1_move) if player1_move == :retreat || :approach
      player2.move(player2_move) if player2_move == :retreat || :approach

      player1.ship.repair if player1_move == :repair
      player2.ship.repair if player2_move == :repair
      
      

  end






end
