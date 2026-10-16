class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var free = Heap<Int>(<)
        (0..<n).forEach { free.push($0) }
        var busy = Heap<(end: Int, room: Int)> { $0.end != $1.end ? $0.end < $1.end : $0.room < $1.room }
        var count = [Int](repeating: 0, count: n)
        for meeting in meetings.sorted(by: { $0[0] < $1[0] }) {
            let start = meeting[0]
            let duration = meeting[1] - meeting[0]
            while let top = busy.top, top.end <= start {
                free.push(busy.pop()!.room)
            }
            if let room = free.pop() {
                busy.push((start + duration, room))
                count[room] += 1
            } else {
                let earliest = busy.pop()!
                busy.push((earliest.end + duration, earliest.room))
                count[earliest.room] += 1
            }
        }
        return count.indices.max { count[$0] != count[$1] ? count[$0] < count[$1] : $0 > $1 }!
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
