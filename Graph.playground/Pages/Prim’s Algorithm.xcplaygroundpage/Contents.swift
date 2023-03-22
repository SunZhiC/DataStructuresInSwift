struct Graph {
    let vertices: Int
    var adjacencyList: [[(Int, Int)]]

    init(vertices: Int) {
        self.vertices = vertices
        adjacencyList = Array(repeating: [], count: vertices)
    }

    mutating func addEdge(_ source: Int, _ destination: Int, _ weight: Int) {
        adjacencyList[source].append((destination, weight))
        adjacencyList[destination].append((source, weight))
    }
}

func prim(graph: Graph) -> Int {
    var visited = Array(repeating: false, count: graph.vertices)
    visited[0] = true
    var minCost = 0

    for _ in 1..<graph.vertices {
        var minWeight = Int.max
        var minSource = -1
        var minDestination = -1

        for source in 0..<graph.vertices where visited[source] {
            for (destination, weight) in graph.adjacencyList[source] where !visited[destination] {
                if weight < minWeight {
                    minWeight = weight
                    minSource = source
                    minDestination = destination
                }
            }
        }

        if minSource != -1 && minDestination != -1 {
            visited[minDestination] = true
            minCost += minWeight
        }
    }

    return minCost
}
var graph = Graph(vertices: 5)

graph.addEdge(0, 1, 2)
graph.addEdge(0, 3, 6)
graph.addEdge(1, 2, 3)
graph.addEdge(1, 3, 8)
graph.addEdge(1, 4, 5)
graph.addEdge(2, 4, 7)
graph.addEdge(3, 4, 9)

let minimumCost = prim(graph: graph)

print("Minimum cost of the minimum spanning tree: \(minimumCost)")
