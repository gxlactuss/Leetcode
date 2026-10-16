class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var queue = [(Int, Int)]()
        var fresh = 0
        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 2 { queue.append((r, c)) }
                if grid[r][c] == 1 { fresh += 1 }
            }
        }
        var minutes = 0
        while fresh > 0 && !queue.isEmpty {
            var next = [(Int, Int)]()
            for (r, c) in queue {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1 {
                    grid[nr][nc] = 2
                    fresh -= 1
                    next.append((nr, nc))
                }
            }
            queue = next
            minutes += 1
        }
        return fresh == 0 ? minutes : -1
    }
}
