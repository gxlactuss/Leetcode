class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let a = Array(s1)
        let b = Array(s2)
        let c = Array(s3)
        if a.count + b.count != c.count { return false }
        var dp = [Bool](repeating: false, count: b.count + 1)
        for i in 0...a.count {
            for j in 0...b.count {
                if i == 0 && j == 0 {
                    dp[j] = true
                } else {
                    let fromA = i > 0 && dp[j] && a[i - 1] == c[i + j - 1]
                    let fromB = j > 0 && dp[j - 1] && b[j - 1] == c[i + j - 1]
                    dp[j] = fromA || fromB
                }
            }
        }
        return dp[b.count]
    }
}
