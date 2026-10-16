class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var adj = [[(node: Int, cost: Int)]](repeating: [], count: n)
        for conn in connections {
            adj[conn[0]].append((conn[1], 1))
            adj[conn[1]].append((conn[0], 0))
        }
        var visited = [Bool](repeating: false, count: n)
        visited[0] = true
        var stack = [0]
        var changes = 0
        while let city = stack.popLast() {
            for (next, cost) in adj[city] where !visited[next] {
                visited[next] = true
                changes += cost
                stack.append(next)
            }
        }
        return changes
    }
}
