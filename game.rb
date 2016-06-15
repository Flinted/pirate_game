require_relative './player'
require_relative './ship'
require_relative './sea'
require_relative './viewer'

class SmoothSailing

attr_reader(:win)

 def initialize(viewer)
  @viewer = viewer
  @win = nil

  @viewer.game_name
  puts 
  player1_name = @viewer.get_player_name(1)
  puts
  player1_ship = Ship.new(@viewer.get_ship_name(1))
  @player1 = Player.new(player1_name, player1_ship)
  puts
  player2_name = @viewer.get_player_name(2)
  puts
  player2_ship = Ship.new(@viewer.get_ship_name(2))
  @player2 = Player.new(player2_name, player2_ship)

  players = [@player1,@player2]

  @sea = Sea.new(players)
 end

 def run()


    while @win == nil
      system('clear')
      @viewer.game_name

      first_player= @sea.players[0]
      
      @viewer.menu( first_player.name, @sea.check_range )

      first_player_first_action = @player1.choose(gets.chomp.to_i)

      puts
      @viewer.second_action()

      first_player_second_action = @player1.choose(gets.chomp.to_i)

      system('clear')

      @sea.change_player

      @viewer.game_name
      second_player= @sea.players[0]
      @viewer.menu( second_player.name, @sea.check_range )

      second_player_first_action = @player2.choose(gets.chomp.to_i)
      puts
      @viewer.second_action()
      second_player_second_action = @player2.choose(gets.chomp.to_i)

      @sea.check_moves(first_player,second_player,first_player_first_action, second_player_first_action)
      first_range = @sea.possible_ranges[@sea.range]
      @viewer.move_info(first_range,first_player,second_player,first_player_first_action,second_player_first_action)

      @win = second_player if !first_player.ship.check_ship_sunk
      @win = first_player if !second_player.ship.check_ship_sunk

      @sea.check_moves(first_player,second_player,first_player_second_action, second_player_second_action)
      second_range = @sea.possible_ranges[@sea.range]

      @viewer.move_info(second_range,first_player,second_player,first_player_second_action,second_player_second_action)

      @win = second_player if !first_player.ship.check_ship_sunk
      @win = first_player if !second_player.ship.check_ship_sunk

      @sea.change_player

      puts
      puts
      @viewer.holes_at_end(first_player,second_player)
      puts
      puts "Press enter for next round"
      gets.chomp
    end

    @viewer.end_game(@win)
 end

system('clear')
game = SmoothSailing.new(Viewer.new())
game.run

end