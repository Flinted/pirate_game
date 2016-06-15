class Viewer

  def menu(player_name, current_range)
    
    puts <<-menu

      Captain  #{player_name}!

      Your ships are in range to #{current_range.to_s} range!

      1: Close the distance!
      2: Bear away!

      3: Fire cannons: alongside
      4: Fire cannons: close range
      5: Fire cannons: mid range
      6: Fire cannons: long range
      7: Fire cannons: extreme range

      8: Repair ship!

      Choose your first action (of 2):
    menu
    print ">> "

  end

  def second_action()
    puts "Choose second action: "
    print ">> "
  end


  def move_info(range, first_player, second_player, first_player_move, second_player_move)
    puts
    puts
    puts "After moving you are in range #{range} range.  "
    puts
    puts "Captain  #{first_player.name} chose to #{first_player_move}."
    puts
    puts "Captain  #{second_player.name} chose to #{second_player_move}."
    sleep 1
    puts
  end

  def move_outcome(first_player_first_move, first_player_second_move, second_player_first_move, second_player_second_move)
    @seas.check_moves(first_player_first_move, first_player_second_move)
    @seas.check_moves(second_player_first_move, second_player_second_move)
  end

  def holes_at_end(first_player,second_player)
    puts "#{first_player.name}'s ship, the #{first_player.ship.name} has #{first_player.ship.holes} holes out of a possible 5 before sinking..."
    puts
    puts"#{second_player.name}'s ship, the #{second_player.ship.name} has #{second_player.ship.holes} holes out of a possible 5 before sinking..."
  end

  def get_player_name(player_number)
    puts "Player #{player_number}, enter your name: "
    return gets.chomp
  end

  def get_ship_name(player_number)
    puts "Player #{player_number}, enter your ship name: "
    return gets.chomp
  end

  def end_game(winner)
    sleep 1
    puts "🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊"
    puts "🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊"
    puts "🌊 🌊 🌊 🌊 🌊 🌊 ⛵ 🌊 🌊 ️🌊 💥 🌊 🌊 🌊 🌊 🌊 🌊"
    puts "🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊"
    puts "🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊 🌊"
    puts
    puts "Captain #{winner.name} of the #{winner.ship.name} has won!"
  end


  def game_name
    puts <<-name
    


         ...
       ..    ...                 .      vv
     ...    .     ..            /|~~                vv
    ..   .      ..  .      ,   / |~~
      ...     .   ..      /|  /  |          vv
         ..              / |~~   |     ,~~~~
                        /  |~~   |    /|~~~~
                       /   |     |   / |
                      /    |     |  /  |
                     /     |     | /   |
                    /      |     |/    |
        =====______/       |     |=====|  __
           ⎞   __ ⎞========|=====|    / ⎞|__)
            ⎞'V` _⎞o_o_o_o_o_o_o_o_o_o_o_o__) 
             ⎞ -------  --  ---- - -  --- /
              ⎞  ----------- -  --- ----  |}
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       SMOOTH SAILING
    name
  end

  def emoticon_update()
    emotes = []
  end
end