class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for sum in stride(from: 1, through: amount, by: 1) {
            for coin in coins where coin <= sum {
                dp[sum] = min(dp[sum], dp[sum - coin] + 1)
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}
