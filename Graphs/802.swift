class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var reverse = [[Int]](repeating: [], count: n)
        var outdegree = graph.map { $0.count }
        for (u, edges) in graph.enumerated() {
            for v in edges {
                reverse[v].append(u)
            }
        }
        var queue = (0..<n).filter { outdegree[$0] == 0 }
        var safe = [Bool](repeating: false, count: n)
        while let node = queue.popLast() {
            safe[node] = true
            for prev in reverse[node] {
                outdegree[prev] -= 1
                if outdegree[prev] == 0 { queue.append(prev) }
            }
        }
        return (0..<n).filter { safe[$0] }
    }
}
