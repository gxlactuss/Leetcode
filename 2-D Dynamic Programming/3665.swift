class Solution {
    func uniquePaths(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count, mod = 1_000_000_007
        var right = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var down = right
        right[0][0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if j > 0 {
                    right[i][j] = grid[i][j - 1] == 1 ? down[i][j - 1] : (right[i][j - 1] + down[i][j - 1]) % mod
                }
                if i > 0 {
                    down[i][j] = grid[i - 1][j] == 1 ? right[i - 1][j] : (right[i - 1][j] + down[i - 1][j]) % mod
                }
            }
        }
        return (right[m - 1][n - 1] + down[m - 1][n - 1]) % mod
    }
}
