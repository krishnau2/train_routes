class RouteDistance
  def initialize(graph, route)
    @graph = graph
    @route = route
  end

  def distance
    total_distance = 0
    @route.split('-').inject do |prev, cur|
      return 'NO SUCH ROUTE' unless @graph[prev][cur]
      total_distance += @graph[prev][cur]
      cur
    end
    total_distance
  end
end