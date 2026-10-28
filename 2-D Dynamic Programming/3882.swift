class Solution {
    func minCost(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var dp = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 1024), count: n), count: m)
        dp[0][0][grid[0][0]] = true
        for i in 0..<m {
            for j in 0..<n where i > 0 || j > 0 {
                for x in 0..<1024 where (i > 0 && dp[i - 1][j][x]) || (j > 0 && dp[i][j - 1][x]) {
                    dp[i][j][x ^ grid[i][j]] = true
                }
            }
        }
        return dp[m - 1][n - 1].firstIndex(of: true)!
    }
}
