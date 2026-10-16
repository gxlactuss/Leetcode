class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let a = Array(text1)
        let b = Array(text2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count: a.count + 1)
        for i in 1...a.count {
            for j in 1...b.count {
                dp[i][j] = a[i - 1] == b[j - 1] ? dp[i - 1][j - 1] + 1 : max(dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[a.count][b.count]
    }
}
