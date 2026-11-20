class Solution {
    func maxSelectedElements(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: 1_000_003)
        var best = 0
        for x in nums.sorted() {
            dp[x + 1] = dp[x] + 1
            dp[x] = dp[x - 1] + 1
            best = max(best, dp[x], dp[x + 1])
        }
        return best
    }
}
