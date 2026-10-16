class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var islands = 0
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == "1" {
                islands += 1
                grid[r][c] = "0"
                var stack = [(r, c)]
                while let (cr, cc) = stack.popLast() {
                    for (nr, nc) in [(cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)]
                    where nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == "1" {
                        grid[nr][nc] = "0"
                        stack.append((nr, nc))
                    }
                }
            }
        }
        return islands
    }
}
