class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        visited[0][0] = true
        var heap = Heap<(time: Int, r: Int, c: Int)> { $0.time < $1.time }
        heap.push((grid[0][0], 0, 0))
        while let (time, r, c) = heap.pop() {
            if r == n - 1 && c == n - 1 { return time }
            for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
            where nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                visited[nr][nc] = true
                heap.push((max(time, grid[nr][nc]), nr, nc))
            }
        }
        return 0
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
