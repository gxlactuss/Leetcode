class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins where coin <= amount {
            for sum in coin...amount {
                dp[sum] &+= dp[sum - coin]
            }
        }
        return dp[amount]
    }
}
