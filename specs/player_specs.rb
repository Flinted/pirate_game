require 'minitest/autorun'
require 'minitest/rg'
require_relative '../player'
require_relative '../ship'

class TestPlayer < MiniTest::Test

  def setup
    ship1 = Ship.new("Boaty McBoatface")
    ship2 = Ship.new("Sir David Attenborough")
    @player1 = Player.new("Josh", ship1)
    @player2 = Player.new("Chris", ship2)
  end

  def test_player_creation
    assert_equal("Josh", @player1.name)
  end

  def test_player_has_right_ship
    assert_equal("Boaty McBoatface", @player1.ship.name)
  end

  def test_add_win
    @player1.add_win
    assert_equal(1, @player1.wins)
  end

  def test_player_choose_alongside
    assert_equal(:alongside ,@player1.choose(3))
  end


  def test_player_choose_nothing
    assert_equal(:repair ,@player1.choose(nil))
  end
end