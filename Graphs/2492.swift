class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var adj = [[(city: Int, distance: Int)]](repeating: [], count: n + 1)
        for road in roads {
            adj[road[0]].append((road[1], road[2]))
            adj[road[1]].append((road[0], road[2]))
        }
        var visited = [Bool](repeating: false, count: n + 1)
        visited[1] = true
        var stack = [1]
        var best = Int.max
        while let city = stack.popLast() {
            for (next, distance) in adj[city] {
                best = min(best, distance)
                if !visited[next] {
                    visited[next] = true
                    stack.append(next)
                }
            }
        }
        return best
    }
}
