require 'minitest/autorun'
require 'minitest/rg'
require_relative '../ship'


class TestShip < MiniTest::Test

  def setup
    @ship1 = Ship.new("Boaty McBoatface")
    @ship2 = Ship.new("Sir David Attenborough")
  end

  def test_ship_has_name
    assert_equal("Boaty McBoatface", @ship1.name)
  end
end