class Solution {
    func getOrder(_ tasks: [[Int]]) -> [Int] {
        let order = tasks.indices.sorted { tasks[$0][0] < tasks[$1][0] }
        var heap = Heap<(time: Int, index: Int)> { $0.time != $1.time ? $0.time < $1.time : $0.index < $1.index }
        var result = [Int]()
        var time = 0
        var i = 0
        while result.count < tasks.count {
            if heap.isEmpty { time = max(time, tasks[order[i]][0]) }
            while i < order.count && tasks[order[i]][0] <= time {
                heap.push((tasks[order[i]][1], order[i]))
                i += 1
            }
            let task = heap.pop()!
            time += task.time
            result.append(task.index)
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
