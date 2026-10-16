class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let n = stoneValue.count
        var dp = [Int](repeating: 0, count: n + 3)
        for i in stride(from: n - 1, through: 0, by: -1) {
            var taken = 0
            dp[i] = Int.min
            for j in i..<min(i + 3, n) {
                taken += stoneValue[j]
                dp[i] = max(dp[i], taken - dp[j + 1])
            }
        }
        return dp[0] > 0 ? "Alice" : dp[0] < 0 ? "Bob" : "Tie"
    }
}
