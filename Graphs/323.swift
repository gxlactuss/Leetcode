class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }
        var components = n
        for edge in edges {
            let a = find(edge[0])
            let b = find(edge[1])
            if a != b {
                parent[a] = b
                components -= 1
            }
        }
        return components
    }
}
