require 'test/unit'
require_relative '../route_map'
require_relative '../route_trip'

class TestRuteTrip < Test::Unit::TestCase

  def setup
    example = ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7']
    @graph = RouteMap.new(example).graph
    @route_trip = RouteTrip.new(@graph)
  end

  def test_c2c_with_3_stops_max
    assert_equal 2, @route_trip.number_of_trips('C', 'C', {min_stops: 1, max_stops: 3})
  end

  def test_a2c_with_exactly_4_stops
    assert_equal 3, @route_trip.number_of_trips('A', 'C', {min_stops: 4, max_stops: 4})
  end

  def test_c2c_with_distance_less_than_30
    assert_equal 7, @route_trip.number_of_trips('C', 'C', {min_stops: 1, max_stops: 100, max_distance: 29})
  end
end
