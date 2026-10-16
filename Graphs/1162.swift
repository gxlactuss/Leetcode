class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        var grid = grid
        let n = grid.count
        var queue = [(Int, Int)]()
        for r in 0..<n {
            for c in 0..<n where grid[r][c] == 1 {
                queue.append((r, c))
            }
        }
        if queue.isEmpty || queue.count == n * n { return -1 }
        var distance = -1
        while !queue.isEmpty {
            var next = [(Int, Int)]()
            for (r, c) in queue {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                    grid[nr][nc] = 1
                    next.append((nr, nc))
                }
            }
            queue = next
            distance += 1
        }
        return distance
    }
}
