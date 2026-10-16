class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let cols = grid[0].count
        var row = [Int](repeating: Int.max, count: cols)
        row[0] = 0
        for r in grid.indices {
            for c in 0..<cols {
                let fromLeft = c > 0 ? row[c - 1] : Int.max
                row[c] = min(row[c], fromLeft) + grid[r][c]
            }
        }
        return row[cols - 1]
    }
}
