class Solution {
    func stoneGame(_ piles: [Int]) -> Bool {
        let n = piles.count
        var dp = piles
        for length in 2...n {
            for i in 0...(n - length) {
                let j = i + length - 1
                dp[i] = max(piles[i] - dp[i + 1], piles[j] - dp[i])
            }
        }
        return dp[0] > 0
    }
}
