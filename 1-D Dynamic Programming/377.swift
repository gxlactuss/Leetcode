class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var dp = [Int](repeating: 0, count: target + 1)
        dp[0] = 1
        for sum in stride(from: 1, through: target, by: 1) {
            for num in nums where num <= sum {
                dp[sum] &+= dp[sum - num]
            }
        }
        return dp[target]
    }
}
