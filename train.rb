require_relative 'route_map'
require_relative 'route_distance'
require_relative 'route_trip'


eg = ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7']
graph = RouteMap.new(eg).graph


puts "1. Distance of the rute A-B-C:      #{RouteDistance.new(graph, 'A-B-C').distance}"
puts "2. Distance of the rute A-D:        #{RouteDistance.new(graph, 'A-D').distance}"
puts "3. Distance of the rute A-D-C:      #{RouteDistance.new(graph, 'A-D-C').distance}"
puts "4. Distance of the rute A-E-B-C-D:  #{RouteDistance.new(graph, 'A-E-B-C-D').distance}"
puts "5. Distance of the rute A-E-D:      #{RouteDistance.new(graph, 'A-E-D').distance}"

result_6 = RouteTrip.new(graph).number_of_trips('C', 'C', {min_stops: 1, max_stops: 3})
puts "6. Number of Trips from C to C, with maximum 3 stops: #{result_6}"

result_7 = RouteTrip.new(graph).number_of_trips('A', 'C', {min_stops: 4, max_stops: 4})
puts "7. Number of Trips from A to C, with exactly 4 stops: #{result_7}"

result_10 = RouteTrip.new(graph).number_of_trips('C', 'C', {min_stops: 1, max_stops: 100, max_distance: 29})
puts "10. Number of Trips from C to C, with distance < 30: #{result_10}"

