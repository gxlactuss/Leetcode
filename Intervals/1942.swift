class Solution {
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        let order = times.indices.sorted { times[$0][0] < times[$1][0] }
        var free = Heap<Int>(<)
        var busy = Heap<(leave: Int, chair: Int)> { $0.leave < $1.leave }
        var nextChair = 0
        for friend in order {
            let (arrival, leave) = (times[friend][0], times[friend][1])
            while let top = busy.top, top.leave <= arrival {
                free.push(busy.pop()!.chair)
            }
            let chair: Int
            if let freeChair = free.pop() {
                chair = freeChair
            } else {
                chair = nextChair
                nextChair += 1
            }
            if friend == targetFriend { return chair }
            busy.push((leave, chair))
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
