require_relative './player'
require_relative './ship'
require_relative './sea'
require_relative './viewer'

class SmoothSailing

attr_reader(:win)

 def initialize(viewer)
  @viewer = viewer
  @win = nil

  player1_name = @viewer.get_player_name(1)
  player1_ship = Ship.new(@viewer.get_ship_name(1))
  @player1 = Player.new(player1_name, player1_ship)
  
  player2_name = @viewer.get_player_name(2)
  player2_ship = Ship.new(@viewer.get_ship_name(2))
  @player2 = Player.new(player2_name, player2_ship)

  players = [@player1,@player2]

  @sea = Sea.new(players)
 end

 def run()

    # while @win != nil
      system('clear')
      first_player= @sea.players[0]
      @viewer.menu( first_player.name, @sea.check_range )
      first_player_first_action = player.choose(gets.chomp)
      @viewer.second_action()
      first_player_second_action = player.choose(gets.chomp)

      system('clear')
      @sea.change_player

      second_player= @sea.players[0]
      @viewer.menu( second_player.name, @sea.check_range )
      second_player_first_action = player.choose(gets.chomp)
      @viewer.second_action()
      second_player_second_action = player.choose(gets.chomp)



      
    # end

 end

game = SmoothSailing.new(Viewer.new())
game.run

end