class RouteTrip
  def initialize(graph)
    @graph = graph
    @trips_count = 0;
  end

  def number_of_trips(start, finish, options, args={stops: 0, distance: 0})

    distance_below_max_distance = options[:max_distance] ? (args[:distance] < options[:max_distance]) : true

    @trips_count += 1 if start == finish && args[:stops] >= options[:min_stops] && distance_below_max_distance

    if distance_below_max_distance && args[:stops] < options[:max_stops]
      @graph[start].each do |node, distance|
        number_of_trips(node, finish, options, {stops: args[:stops] + 1, distance: args[:distance] + distance})
      end
    end
    @trips_count
  end
end