class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var closed = 0
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 0 {
                var isClosed = true
                grid[r][c] = 1
                var stack = [(r, c)]
                while let (cr, cc) = stack.popLast() {
                    if cr == 0 || cr == rows - 1 || cc == 0 || cc == cols - 1 {
                        isClosed = false
                    }
                    for (nr, nc) in [(cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)]
                    where nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 0 {
                        grid[nr][nc] = 1
                        stack.append((nr, nc))
                    }
                }
                if isClosed {
                    closed += 1
                }
            }
        }
        return closed
    }
}
