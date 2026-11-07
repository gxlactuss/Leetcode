class Solution {
    func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
        var free = Heap<(weight: Int, index: Int)> { $0.weight != $1.weight ? $0.weight < $1.weight : $0.index < $1.index }
        var busy = Heap<(time: Int, weight: Int, index: Int)> {
            if $0.time != $1.time { return $0.time < $1.time }
            return $0.weight != $1.weight ? $0.weight < $1.weight : $0.index < $1.index
        }
        for (i, w) in servers.enumerated() { free.push((w, i)) }
        var result = [Int]()
        for (j, task) in tasks.enumerated() {
            var time = j
            if free.isEmpty { time = max(time, busy.top!.time) }
            while let server = busy.top, server.time <= time {
                busy.pop()
                free.push((server.weight, server.index))
            }
            let server = free.pop()!
            busy.push((time + task, server.weight, server.index))
            result.append(server.index)
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
