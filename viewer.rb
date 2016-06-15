class Viewer

  def menu(player_name, current_range)
    
    puts <<-menu
      Captain  #{player_name}!

      Your ships are at #{current_range} range!

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

  def get_player_name(player_number)
    puts "Player #{player_number}, enter your name: "
    return gets.chomp
  end

  def get_ship_name(player_number)
    puts "Player #{player_number}, enter your ship name: "
    return gets.chomp
  end

  def turn(player_name, current_range)
    menu(player_name, current_range)
    first_action = gets.chomp
    second_action()
    second_action = gets.chomp
  end

  viewer =Viewer.new()
  viewer.turn("Josh")
end