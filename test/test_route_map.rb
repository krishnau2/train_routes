require 'test/unit'
require_relative '../route_map'

class TestRuteMap < Test::Unit::TestCase

  def test_graph_will_return_a_hash
    example_input = ['AB5', 'AD5']
    expected = {"A"=>{"B"=>5, "D"=>5}}
    assert_equal expected, RouteMap.new(example_input).graph
  end

end
