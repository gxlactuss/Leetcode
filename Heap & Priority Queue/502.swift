class Solution {
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        let order = capital.indices.sorted { capital[$0] < capital[$1] }
        var heap = Heap<Int>(>)
        var w = w
        var i = 0
        for _ in 0..<k {
            while i < order.count && capital[order[i]] <= w {
                heap.push(profits[order[i]])
                i += 1
            }
            guard let profit = heap.pop() else { break }
            w += profit
        }
        return w
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
