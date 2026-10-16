class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        var grid = grid
        let n = grid.count
        var queue = [(Int, Int)]()
        outer: for r in 0..<n {
            for c in 0..<n where grid[r][c] == 1 {
                grid[r][c] = 2
                var stack = [(r, c)]
                while let (cr, cc) = stack.popLast() {
                    queue.append((cr, cc))
                    for (nr, nc) in [(cr + 1, cc), (cr - 1, cc), (cr, cc + 1), (cr, cc - 1)]
                    where nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 1 {
                        grid[nr][nc] = 2
                        stack.append((nr, nc))
                    }
                }
                break outer
            }
        }
        var distance = 0
        while !queue.isEmpty {
            var next = [(Int, Int)]()
            for (r, c) in queue {
                for (nr, nc) in [(r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)]
                where nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] != 2 {
                    if grid[nr][nc] == 1 { return distance }
                    grid[nr][nc] = 2
                    next.append((nr, nc))
                }
            }
            queue = next
            distance += 1
        }
        return -1
    }
}
