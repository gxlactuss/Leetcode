class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let cols = obstacleGrid[0].count
        var row = [Int](repeating: 0, count: cols)
        row[0] = 1
        for r in obstacleGrid.indices {
            for c in 0..<cols {
                if obstacleGrid[r][c] == 1 {
                    row[c] = 0
                } else if c > 0 {
                    row[c] += row[c - 1]
                }
            }
        }
        return row[cols - 1]
    }
}
