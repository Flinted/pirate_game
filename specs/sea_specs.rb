require 'minitest/autorun'
require 'minitest/rg'
require_relative '../sea'
require_relative '../ship'
require_relative '../player'

class TestSea < MiniTest::Test

  def setup
    ship1 = Ship.new("Boaty McBoatface")
    ship2 = Ship.new("Sir David Attenborough")

    player1 = Player.new("Josh", ship1)
    player2 = Player.new("Chris", ship2)

    players = [player1,player2]

    @sea = Sea.new(players)
  end

  def test_sea_has_two_players
    assert_equal(2, @sea.player_count)
  end

  def test_ship_move_closer
    @sea.move(:approach)
    assert_equal(:close, @sea.check_range)
  end

  def test_ship_move_away
    @sea.move(:retreat)
    assert_equal(:far, @sea.check_range)
  end

  def test_ship_cannot_move_past_alongside
    @sea.move(:approach)
    @sea.move(:approach)
    @sea.move(:approach)
    assert_equal(:alongside, @sea.check_range)
  end

end