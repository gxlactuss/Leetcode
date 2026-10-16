class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let t = Array(t)
        var dp = [Int](repeating: 0, count: t.count + 1)
        dp[0] = 1
        for c in s {
            for j in stride(from: t.count, through: 1, by: -1) where t[j - 1] == c {
                dp[j] &+= dp[j - 1]
            }
        }
        return dp[t.count]
    }
}
