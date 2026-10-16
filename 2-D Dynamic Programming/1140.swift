class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        let n = piles.count
        var suffix = [Int](repeating: 0, count: n + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            suffix[i] = suffix[i + 1] + piles[i]
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
        for i in stride(from: n - 1, through: 0, by: -1) {
            for m in 1...n {
                if i + 2 * m >= n {
                    dp[i][m] = suffix[i]
                } else {
                    var best = 0
                    for x in 1...(2 * m) {
                        best = max(best, suffix[i] - dp[i + x][max(m, x)])
                    }
                    dp[i][m] = best
                }
            }
        }
        return dp[0][1]
    }
}
