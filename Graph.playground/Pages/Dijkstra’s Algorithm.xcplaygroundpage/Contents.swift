struct Graph {
    let vertices: Int
    var adjacencyList: [[(Int, Int)]]

    init(vertices: Int) {
        self.vertices = vertices
        adjacencyList = Array(repeating: [], count: vertices)
    }

    mutating func addEdge(_ source: Int, _ destination: Int, _ weight: Int) {
        adjacencyList[source].append((destination, weight))
    }
}

func dijkstra(graph: Graph, source: Int) -> [Int] {
    var distances = Array(repeating: Int.max, count: graph.vertices)
    distances[source] = 0

    var visited = Array(repeating: false, count: graph.vertices)
    for _ in 0..<graph.vertices {
        var minDistance = Int.max
        var minIndex = -1

        for index in 0..<graph.vertices {
            if !visited[index] && distances[index] < minDistance {
                minDistance = distances[index]
                minIndex = index
            }
        }

        guard minIndex != -1 else { break }

        visited[minIndex] = true
        for (neighbor, weight) in graph.adjacencyList[minIndex] {
            let newDistance = distances[minIndex] + weight
            if newDistance < distances[neighbor] {
                distances[neighbor] = newDistance
            }
        }
    }

    return distances
}
var graph = Graph(vertices: 5)

graph.addEdge(0, 1, 10)
graph.addEdge(0, 2, 5)
graph.addEdge(1, 3, 1)
graph.addEdge(1, 2, 2)
graph.addEdge(2, 1, 3)
graph.addEdge(2, 3, 9)
graph.addEdge(2, 4, 2)
graph.addEdge(3, 4, 4)
graph.addEdge(4, 3, 6)
graph.addEdge(4, 0, 7)

let shortestDistances = dijkstra(graph: graph, source: 0)

print("Shortest distances from source vertex 0: \(shortestDistances)")
