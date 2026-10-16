class Solution {
    func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var heap = Heap<(size: Int, end: Int)> { $0.size < $1.size }
        var result = [Int](repeating: -1, count: queries.count)
        var i = 0
        for q in queries.indices.sorted(by: { queries[$0] < queries[$1] }) {
            let query = queries[q]
            while i < intervals.count && intervals[i][0] <= query {
                heap.push((intervals[i][1] - intervals[i][0] + 1, intervals[i][1]))
                i += 1
            }
            while let top = heap.top, top.end < query {
                heap.pop()
            }
            if let top = heap.top { result[q] = top.size }
        }
        return result
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
