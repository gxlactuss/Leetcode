class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s)
        let p = Array(p)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: p.count + 1), count: s.count + 1)
        dp[s.count][p.count] = true
        for i in stride(from: s.count, through: 0, by: -1) {
            for j in stride(from: p.count - 1, through: 0, by: -1) {
                let firstMatch = i < s.count && (p[j] == s[i] || p[j] == ".")
                if j + 1 < p.count && p[j + 1] == "*" {
                    dp[i][j] = dp[i][j + 2] || (firstMatch && dp[i + 1][j])
                } else {
                    dp[i][j] = firstMatch && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}
