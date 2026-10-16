class Solution {
    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        func topoSort(_ conditions: [[Int]]) -> [Int] {
            var adj = [[Int]](repeating: [], count: k + 1)
            var indegree = [Int](repeating: 0, count: k + 1)
            for cond in conditions {
                adj[cond[0]].append(cond[1])
                indegree[cond[1]] += 1
            }
            var queue = (1...k).filter { indegree[$0] == 0 }
            var order = [Int]()
            while let node = queue.popLast() {
                order.append(node)
                for next in adj[node] {
                    indegree[next] -= 1
                    if indegree[next] == 0 { queue.append(next) }
                }
            }
            return order
        }
        let rowOrder = topoSort(rowConditions)
        let colOrder = topoSort(colConditions)
        if rowOrder.count < k || colOrder.count < k { return [] }
        var colIndex = [Int](repeating: 0, count: k + 1)
        for (i, num) in colOrder.enumerated() {
            colIndex[num] = i
        }
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: k), count: k)
        for (r, num) in rowOrder.enumerated() {
            matrix[r][colIndex[num]] = num
        }
        return matrix
    }
}
