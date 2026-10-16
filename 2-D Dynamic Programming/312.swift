class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let balloons = [1] + nums + [1]
        let n = balloons.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for length in 2..<n {
            for left in 0..<(n - length) {
                let right = left + length
                for k in (left + 1)..<right {
                    dp[left][right] = max(
                        dp[left][right],
                        dp[left][k] + dp[k][right] + balloons[left] * balloons[k] * balloons[right]
                    )
                }
            }
        }
        return dp[0][n - 1]
    }
}
