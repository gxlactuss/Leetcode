class Solution {
    func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {
        // Free servers are keyed by the next request index that maps to them,
        // so the smallest key is the next free server at or after i % k.
        var free = Heap<Int>(<)
        var busy = Heap<(end: Int, server: Int)> { $0.end < $1.end }
        for server in 0..<k { free.push(server) }
        var count = [Int](repeating: 0, count: k)
        for i in arrival.indices {
            while let top = busy.top, top.end <= arrival[i] {
                busy.pop()
                free.push(i + ((top.server - i) % k + k) % k)
            }
            guard let key = free.pop() else { continue }
            let server = key % k
            count[server] += 1
            busy.push((arrival[i] + load[i], server))
        }
        let most = count.max()!
        return count.indices.filter { count[$0] == most }
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
