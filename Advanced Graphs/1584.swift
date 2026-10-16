class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var inTree = [Bool](repeating: false, count: n)
        var minCost = [Int](repeating: Int.max, count: n)
        minCost[0] = 0
        var total = 0
        for _ in 0..<n {
            var u = -1
            for i in 0..<n where !inTree[i] && (u == -1 || minCost[i] < minCost[u]) {
                u = i
            }
            inTree[u] = true
            total += minCost[u]
            for v in 0..<n where !inTree[v] {
                let cost = abs(points[u][0] - points[v][0]) + abs(points[u][1] - points[v][1])
                minCost[v] = min(minCost[v], cost)
            }
        }
        return total
    }
}
