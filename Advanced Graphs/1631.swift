class Solution {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let rows = heights.count
        let cols = heights[0].count
        var effort = [[Int]](repeating: [Int](repeating: Int.max, count: cols), count: rows)
        effort[0][0] = 0
        var heap = Heap<(effort: Int, r: Int, c: Int)> { $0.effort < $1.effort }
        heap.push((0, 0, 0))
        while let (e, r, c) = heap.pop() {
            if r == rows - 1 && c == cols - 1 { return e }
            if e > effort[r][c] { continue }
            for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
            where nr >= 0 && nr < rows && nc >= 0 && nc < cols {
                let next = max(e, abs(heights[nr][nc] - heights[r][c]))
                if next < effort[nr][nc] {
                    effort[nr][nc] = next
                    heap.push((next, nr, nc))
                }
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
