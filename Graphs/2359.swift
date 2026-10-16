class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        func distances(_ start: Int) -> [Int] {
            var dist = [Int](repeating: -1, count: edges.count)
            var node = start
            var d = 0
            while node != -1 && dist[node] == -1 {
                dist[node] = d
                d += 1
                node = edges[node]
            }
            return dist
        }
        let d1 = distances(node1)
        let d2 = distances(node2)
        var best = -1
        var bestDistance = Int.max
        for i in edges.indices where d1[i] != -1 && d2[i] != -1 {
            let d = max(d1[i], d2[i])
            if d < bestDistance {
                bestDistance = d
                best = i
            }
        }
        return best
    }
}
