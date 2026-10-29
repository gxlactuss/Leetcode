class Solution {
    func palindromePath(_ n: Int, _ edges: [[Int]], _ s: String, _ queries: [String]) -> [Bool] {
        var adj = [[Int]](repeating: [], count: n)
        for e in edges {
            adj[e[0]].append(e[1])
            adj[e[1]].append(e[0])
        }
        let LOG = 17
        var up = [[Int]](repeating: [Int](repeating: 0, count: n), count: LOG)
        var depth = [Int](repeating: 0, count: n), tin = depth, tout = depth
        var timer = 0
        var stack = [(0, 0)]
        while let (u, i) = stack.popLast() {
            if i == 0 {
                tin[u] = timer
                timer += 1
            }
            if i < adj[u].count {
                stack.append((u, i + 1))
                let v = adj[u][i]
                if u == 0 || v != up[0][u] {
                    up[0][v] = u
                    depth[v] = depth[u] + 1
                    stack.append((v, 0))
                }
            } else {
                tout[u] = timer
            }
        }
        for k in 1..<LOG {
            for v in 0..<n { up[k][v] = up[k - 1][up[k - 1][v]] }
        }
        func lca(_ a: Int, _ b: Int) -> Int {
            var a = a, b = b
            if depth[a] < depth[b] { swap(&a, &b) }
            for k in stride(from: LOG - 1, through: 0, by: -1) where depth[a] - (1 << k) >= depth[b] {
                a = up[k][a]
            }
            if a == b { return a }
            for k in stride(from: LOG - 1, through: 0, by: -1) where up[k][a] != up[k][b] {
                a = up[k][a]
                b = up[k][b]
            }
            return up[0][a]
        }

        // XOR Fenwick tree over Euler tour: range update, point query gives root-to-node mask
        var bit = [Int](repeating: 0, count: n + 1)
        func add(_ i: Int, _ x: Int) {
            var i = i + 1
            while i <= n {
                bit[i] ^= x
                i += i & -i
            }
        }
        func get(_ i: Int) -> Int {
            var i = i + 1, res = 0
            while i > 0 {
                res ^= bit[i]
                i -= i & -i
            }
            return res
        }
        func toggle(_ u: Int, _ x: Int) {
            add(tin[u], x)
            if tout[u] < n { add(tout[u], x) }
        }

        var mask = s.utf8.map { 1 << Int($0 - 97) }
        for u in 0..<n { toggle(u, mask[u]) }
        var res = [Bool]()
        for q in queries {
            let p = q.split(separator: " ")
            let u = Int(p[1])!
            if p[0] == "update" {
                let m = 1 << Int(p[2].utf8.first! - 97)
                toggle(u, mask[u] ^ m)
                mask[u] = m
            } else {
                let v = Int(p[2])!
                let x = get(tin[u]) ^ get(tin[v]) ^ mask[lca(u, v)]
                res.append(x & (x - 1) == 0)
            }
        }
        return res
    }
}
