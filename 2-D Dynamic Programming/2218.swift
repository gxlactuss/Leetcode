class Solution {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
        var dp = [Int](repeating: 0, count: k + 1)
        for pile in piles {
            var prefix = [0]
            for coin in pile.prefix(k) {
                prefix.append(prefix.last! + coin)
            }
            for coins in stride(from: k, through: 1, by: -1) {
                for take in 1..<min(prefix.count, coins + 1) {
                    dp[coins] = max(dp[coins], dp[coins - take] + prefix[take])
                }
            }
        }
        return dp[k]
    }
}
