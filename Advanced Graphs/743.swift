class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var adj = [[(node: Int, time: Int)]](repeating: [], count: n + 1)
        for t in times {
            adj[t[0]].append((t[1], t[2]))
        }
        var dist = [Int](repeating: Int.max, count: n + 1)
        dist[k] = 0
        var heap = Heap<(time: Int, node: Int)> { $0.time < $1.time }
        heap.push((0, k))
        while let (time, node) = heap.pop() {
            if time > dist[node] { continue }
            for (next, cost) in adj[node] where time + cost < dist[next] {
                dist[next] = time + cost
                heap.push((dist[next], next))
            }
        }
        let result = dist[1...].max()!
        return result == Int.max ? -1 : result
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
