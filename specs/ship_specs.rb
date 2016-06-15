require 'minitest/autorun'
require 'minitest/rg'
require_relative '../ship'


class TestShip < MiniTest::Test

  def setup
    @ship1 = Ship.new("Boaty McBoatface")
    @ship2 = Ship.new("Sir David Attenborough")

    player1 = Player.new("Josh", ship1)
    player2 = Player.new("Chris", ship2)

    players = [player1,player2]

    @sea = Sea.new(players)
  end

  def test_ship_has_name
    assert_equal("Boaty McBoatface", @ship1.name)
  end

  def test_ship_shoot_miss
    range = 5
    assert_equal("MISS!", @ship1.shoot(3, range))
  end

  def test_ship_shoot_hits
    range = 5
    assert_equal("HIT!", @ship1.shoot(5, range))
  end

  def test_ship_takes_damage
    @ship1.take_damage("HIT!")
    assert_equal(1,@ship1.holes)
  end

  def test_ship_takes_no_damage
    @ship1.take_damage("MISS!")
    assert_equal(0,@ship1.holes)
  end

  def test_ship_sunk
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.check_ship_sunk()
    assert_equal(false, @ship1.afloat)
  end
  def test_ship_not_sunk
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("HIT!")
    @ship1.take_damage("MISS!")
    @ship1.check_ship_sunk()
    assert_equal(true, @ship1.afloat)
  end

  
end