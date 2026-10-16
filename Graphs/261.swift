class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 { return false }
        var parent = Array(0..<n)
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
            if a == b { return false }
            parent[a] = b
        }
        return true
    }
}
