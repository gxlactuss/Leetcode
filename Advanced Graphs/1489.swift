class Solution {
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let order = edges.indices.sorted { edges[$0][2] < edges[$1][2] }

        func mstWeight(skip: Int, force: Int) -> Int {
            var parent = Array(0..<n)
            func find(_ x: Int) -> Int {
                var x = x
                while parent[x] != x {
                    parent[x] = parent[parent[x]]
                    x = parent[x]
                }
                return x
            }
            var weight = 0
            var used = 0
            if force != -1 {
                parent[find(edges[force][0])] = find(edges[force][1])
                weight += edges[force][2]
                used += 1
            }
            for i in order where i != skip {
                let a = find(edges[i][0])
                let b = find(edges[i][1])
                if a != b {
                    parent[a] = b
                    weight += edges[i][2]
                    used += 1
                }
            }
            return used == n - 1 ? weight : Int.max
        }

        let best = mstWeight(skip: -1, force: -1)
        var critical = [Int]()
        var pseudo = [Int]()
        for i in edges.indices {
            if mstWeight(skip: i, force: -1) > best {
                critical.append(i)
            } else if mstWeight(skip: -1, force: i) == best {
                pseudo.append(i)
            }
        }
        return [critical, pseudo]
    }
}
