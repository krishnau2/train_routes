# Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

class TrainRoutes
  def initialize()
    @graph = {
              "A"=>{"B"=>5, "D"=>5, "E"=>7}, 
              "B"=>{"C"=>4}, 
              "C"=>{"D"=>8, "E"=>2}, 
              "D"=>{"C"=>8, "E"=>6}, 
              "E"=>{"B"=>3}
            }
    @trips_count = 0;            
  end

  def distance(route)
    total_distance = 0
    route.split('-').inject do |prev, cur|
      return 'NO SUCH ROUTE' unless @graph[prev][cur]
      total_distance += @graph[prev][cur]
      cur
    end
    total_distance
  end
  
  def number_of_trips(start, finish, options, args={stops: 0, distance: 0})

    distance_below_max_distance = options[:max_distance] ? (args[:distance] < options[:max_distance]) : true

    @trips_count += 1 if start == finish && args[:stops] >= options[:min_stops] && distance_below_max_distance

    if distance_below_max_distance && args[:stops] <= options[:max_stops]
      @graph[start].each do |node, distance|        
        number_of_trips(node, finish, options, {stops: args[:stops] + 1, distance: args[:distance] + distance})
      end
    end
    @trips_count
  end
  
end


train_route = TrainRoutes.new()

puts "1. Distance of the rute A-B-C: #{train_route.distance('A-B-C')}"
puts "2. Distance of the rute A-B-C: #{train_route.distance('A-D')}"
puts "3. Distance of the rute A-B-C: #{train_route.distance('A-D-C')}"
puts "4. Distance of the rute A-B-C: #{train_route.distance('A-E-B-C-D')}"
puts "5. Distance of the rute A-B-C: #{train_route.distance('A-E-D')}"

options = {min_stops: 1, max_stops: 3}
result_6 = TrainRoutes.new().number_of_trips('C', 'C', options)
puts "6. Number of Trips from C to C, with maximum 3 stops: #{result_6}"
options = {min_stops: 4, max_stops: 4}
result_7 = TrainRoutes.new().number_of_trips('A', 'C', options)
puts "7. Number of Trips from A to C, with exactly 4 stops: #{result_7}"

options = {min_stops: 1, max_stops: 10, max_distance: 30}
result_10 = TrainRoutes.new().number_of_trips('C', 'C', options)
puts "10. Number of Trips from C to C, with distance < 30: #{result_10}"

