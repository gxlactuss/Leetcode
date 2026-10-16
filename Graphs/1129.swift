class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var adj = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: 2)
        for edge in redEdges { adj[0][edge[0]].append(edge[1]) }
        for edge in blueEdges { adj[1][edge[0]].append(edge[1]) }
        var result = [Int](repeating: -1, count: n)
        var visited = [[Bool]](repeating: [false, false], count: n)
        visited[0] = [true, true]
        var queue = [(node: 0, color: 0), (node: 0, color: 1)]
        var distance = 0
        while !queue.isEmpty {
            var next = [(node: Int, color: Int)]()
            for (node, color) in queue {
                if result[node] == -1 { result[node] = distance }
                let nextColor = 1 - color
                for neighbor in adj[nextColor][node] where !visited[neighbor][nextColor] {
                    visited[neighbor][nextColor] = true
                    next.append((neighbor, nextColor))
                }
            }
            queue = next
            distance += 1
        }
        return result
    }
}
