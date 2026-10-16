class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let total = nums.reduce(0, +)
        if abs(target) > total || (total + target) % 2 != 0 { return 0 }
        let goal = (total + target) / 2
        var dp = [Int](repeating: 0, count: goal + 1)
        dp[0] = 1
        for num in nums {
            for sum in stride(from: goal, through: num, by: -1) {
                dp[sum] += dp[sum - num]
            }
        }
        return dp[goal]
    }
}
