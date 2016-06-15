require 'minitest/autorun'
require 'minitest/rg'
require_relative '../ship'
require_relative '../sea'
require_relative '../player'


class TestShip < MiniTest::Test

  def setup
    @ship1 = Ship.new("Boaty McBoatface")
    @ship2 = Ship.new("Sir David Attenborough")

    player1 = Player.new("Josh", @ship1)
    player2 = Player.new("Chris", @ship2)

    players = [player1,player2]

    @sea = Sea.new(players)
  end

  def test_ship_has_name
    assert_equal("Boaty McBoatface", @ship1.name)
  end

  def test_ship_shoot_miss
    # range = 4
    @ship1.shoot(5, range)
    assert_equal(0, @ship1.holes)
  end

  def test_ship_shoot_hits
    range = 5
    @ship1.shoot(5, range)
    assert_equal(1, @ship1.holes) 
  end

  def test_ship_sunk
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.check_ship_sunk()
    assert_equal(false, @ship1.afloat)
  end
  def test_ship_not_sunk
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.take_damage()
    @ship1.check_ship_sunk()
    assert_equal(true, @ship1.afloat)
  end

  
end