class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 { return -1 }
        var grid = grid
        grid[0][0] = 1
        var queue = [(0, 0)]
        var length = 1
        while !queue.isEmpty {
            var next = [(Int, Int)]()
            for (r, c) in queue {
                if r == n - 1 && c == n - 1 { return length }
                for dr in -1...1 {
                    for dc in -1...1 {
                        let nr = r + dr
                        let nc = c + dc
                        if nr >= 0 && nr < n && nc >= 0 && nc < n && grid[nr][nc] == 0 {
                            grid[nr][nc] = 1
                            next.append((nr, nc))
                        }
                    }
                }
            }
            queue = next
            length += 1
        }
        return -1
    }
}
