class RouteMap
  # eg: [AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7]
  def initialize(info)
    @info = info
    @graph = {}
  end

  def graph
    @info.each do |vertex|
      source    = vertex[0, 1]
      terminal  = vertex[1, 1]
      weight    = vertex[2, 1]
      @graph[source] ||= {}
      @graph[source][terminal] = weight.to_i
    end
    @graph
  end
end