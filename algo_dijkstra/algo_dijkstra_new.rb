def weight(u, v)
    special_chars = ['b','j']  
    (special_chars.include?(u) or special_chars.include?(v)) ? 1: $edges[u].find { |x| x[0] == v }[1]

  end
  
  def dijkstra(graph, s, g)
    d = [Float::INFINITY] * graph.size
    prev = [nil] * graph.size
    q = graph.dup
    d[graph.index(s)] = 0
  
    while !q.empty?
      min_index = d.each_with_index.min[1]
      u = q[min_index]
      q.delete_at(min_index)
      $edges[u].each do |v, _|
        target_d = d[graph.index(u)] + weight(u, v)
        if d[graph.index(v)] > target_d
          d[graph.index(v)] = target_d
          prev[graph.index(v)] = u
        end
      end
    end
  
    shortest_path = []
    index_of_g = graph.index(g)
    until index_of_g.nil?
      shortest_path.unshift(graph[index_of_g])
      index_of_g = graph.index(prev[index_of_g])
    end
  
    shortest_path
  end
  
  $edges = {
    'a' => [['b', 0], ['h', 0]],
    'b' => [['a', 0], ['c', 0], ['g', 0]],
    'c' => [['b', 0], ['f', 0], ['d', 0]],
    'd' => [['c', 0], ['e', 0]],
    'e' => [['d', 0], ['f', 0], ['l', 0]],
    'f' => [['c', 0], ['g', 0], ['e', 0],['k', 0]],
    'g' => [['b', 0], ['f', 0], ['h', 0], ['j', 0]],
    'h' => [['a', 0], ['g', 0], ['i', 0]],
    'i' => [['h', 0], ['j', 0]],
    'j' => [['g', 0], ['i', 0], ['k', 0]],
    'k' => [['f', 0], ['j', 0], ['l', 0]],
    'l' => [['e', 0], ['k', 0]],
  }
  
  graph = ['a', 'b', 'c', 'd', 'e', 'f','g','h','i','j','k','l']
  
  puts dijkstra(graph, 'a', 'l').join(' -> ')
