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
  
  def number_of_trips(start, finish, max_stops, args={stops: 0})

    @trips_count += 1 if start == finish && args[:stops] > 0

    unless args[:stops] == max_stops
      @graph[start].each do |node, distance|        
        number_of_trips(node, finish, max_stops, {stops: args[:stops] + 1})
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

result_6 = TrainRoutes.new().number_of_trips('C', 'C', 3)
puts "6. Number of Trips starting and eding at C, maximum 3 stops: #{result_6}"

