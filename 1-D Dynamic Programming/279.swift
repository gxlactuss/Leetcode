class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = [Int](repeating: Int.max, count: n + 1)
        dp[0] = 0
        for i in stride(from: 1, through: n, by: 1) {
            var j = 1
            while j * j <= i {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
}
