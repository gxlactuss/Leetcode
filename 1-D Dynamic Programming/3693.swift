class Solution {
    func climbStairs(_ n: Int, _ costs: [Int]) -> Int {
        var dp = [Int](repeating: Int.max, count: n + 1)
        dp[0] = 0
        for j in 1...n {
            for k in 1...3 where j - k >= 0 {
                dp[j] = min(dp[j], dp[j - k] + costs[j - 1] + k * k)
            }
        }
        return dp[n]
    }
}
