class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var parent = Array(0...edges.count)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        for edge in edges {
            let a = find(edge[0])
            let b = find(edge[1])
            if a == b { return edge }
            parent[a] = b
        }
        return []
    }
}
