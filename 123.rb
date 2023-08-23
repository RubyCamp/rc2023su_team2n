def weight(u, v)
    $edges[[u, v]]
  end
  
  def dijkstra(graph, s, g)
    d = {}
    prev = {}
    q = []
    graph.each do |v|
      if s == v
        d[v] = 0
      else
        d[v] = 1
      end
      q.push(v)
    end
    while !q.empty?
      u = q.min_by { |v| d[v] }
      q.delete(u)
      $edges.select { |edge, _| edge[0] == u }.each do |(v1, v), _|
        target_d = d[u] + weight(u, v)
        if d[v] > target_d
          d[v] = target_d
          prev[v] = u
        end
      end
    end
    shortest_path = []
    until g == s
      shortest_path.unshift(g)
      g = prev[g]
    end
    shortest_path.unshift(s)
  end
  
  $edges = {
    ['a', 'b'] => 1,
    ['a', 'h'] => 0,
    ['b', 'a'] => 1,
    ['b', 'c'] => 1,
    ['b', 'g'] => 1,
    ['c', 'b'] => 1,
    ['c', 'f'] => 0,
    ['c', 'd'] => 0,
    ['d', 'c'] => 0,
    ['d', 'e'] => 0,
    ['e', 'd'] => 0,
    ['e', 'f'] => 0,
    ['e', 'l'] => 1,
    ['f', 'c'] => 0,
    ['f', 'g'] => 1,
    ['f', 'e'] => 0,
    ['g', 'b'] => 1,
    ['g', 'f'] => 1,
    ['g', 'h'] => 1,
    ['h', 'a'] => 0,
    ['h', 'g'] => 1,
    ['h', 'i'] => 0,
    ['i', 'h'] => 0,
    ['i', 'j'] => 0,
    ['j', 'g'] => 1,
    ['j', 'i'] => 0,
    ['j', 'k'] => 0,
    ['k', 'f'] => 0,
    ['k', 'j'] => 0,
    ['k', 'l'] => 1,
    ['l', 'e'] => 1,
    ['l', 'k'] => 1,
  }
  
  graph = ['a', 'b', 'c', 'd', 'e', 'f','g','h','i','j','k','l']
  
  
  puts dijkstra(graph, 'a', 'c').join(' -> ')