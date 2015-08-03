require 'test/unit'
require_relative '../route_map'
require_relative '../route_distance'

class TestRuteDistance < Test::Unit::TestCase

  def setup
    example = ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7']
    @graph = RouteMap.new(example).graph

  end

  def test_distance_a_b_c
    assert_equal 9, RouteDistance.new(@graph, 'A-B-C').distance
  end

  def test_distance_a_d
    assert_equal 5, RouteDistance.new(@graph, 'A-D').distance
  end

  def test_distance_a_d_c
    assert_equal 13, RouteDistance.new(@graph, 'A-D-C').distance
  end

  def test_distance_a_e_b_c_d
    assert_equal 22, RouteDistance.new(@graph, 'A-E-B-C-D').distance
  end

  def test_distance_a_e_d
    assert_equal 'NO SUCH ROUTE', RouteDistance.new(@graph, 'A-E-D').distance
  end

end
