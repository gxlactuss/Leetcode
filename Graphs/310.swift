class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 { return [0] }
        var adj = [Set<Int>](repeating: [], count: n)
        for edge in edges {
            adj[edge[0]].insert(edge[1])
            adj[edge[1]].insert(edge[0])
        }
        var leaves = (0..<n).filter { adj[$0].count == 1 }
        var remaining = n
        while remaining > 2 {
            remaining -= leaves.count
            var next = [Int]()
            for leaf in leaves {
                let neighbor = adj[leaf].first!
                adj[neighbor].remove(leaf)
                if adj[neighbor].count == 1 { next.append(neighbor) }
            }
            leaves = next
        }
        return leaves
    }
}
