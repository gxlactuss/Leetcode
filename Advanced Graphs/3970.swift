class Solution {
    func shortestPath(_ n: Int, _ edges: [[Int]], _ labels: String, _ k: Int) -> Int {
        let labels = Array(labels.utf8)
        var adj = [[(node: Int, weight: Int)]](repeating: [], count: n)
        for e in edges {
            adj[e[0]].append((e[1], e[2]))
        }
        var dist = [Int](repeating: Int.max, count: n * (k + 1))
        dist[1] = 0
        var heap = Heap<(dist: Int, node: Int, run: Int)> { $0.dist < $1.dist }
        heap.push((0, 0, 1))
        while let (d, node, run) = heap.pop() {
            if d > dist[node * (k + 1) + run] { continue }
            if node == n - 1 { return d }
            for (next, weight) in adj[node] {
                let nextRun = labels[next] == labels[node] ? run + 1 : 1
                let state = next * (k + 1) + nextRun
                if nextRun <= k && d + weight < dist[state] {
                    dist[state] = d + weight
                    heap.push((dist[state], next, nextRun))
                }
            }
        }
        return -1
    }
}

struct Heap<T> {
    private var items = [T]()
    private let areSorted: (T, T) -> Bool

    init(_ areSorted: @escaping (T, T) -> Bool) {
        self.areSorted = areSorted
    }

    var count: Int { items.count }
    var isEmpty: Bool { items.isEmpty }
    var top: T? { items.first }

    mutating func push(_ item: T) {
        items.append(item)
        var i = items.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if !areSorted(items[i], items[parent]) { break }
            items.swapAt(i, parent)
            i = parent
        }
    }

    @discardableResult
    mutating func pop() -> T? {
        guard !items.isEmpty else { return nil }
        items.swapAt(0, items.count - 1)
        let item = items.removeLast()
        var i = 0
        while true {
            let left = 2 * i + 1
            let right = left + 1
            var best = i
            if left < items.count && areSorted(items[left], items[best]) { best = left }
            if right < items.count && areSorted(items[right], items[best]) { best = right }
            if best == i { break }
            items.swapAt(i, best)
            i = best
        }
        return item
    }
}
