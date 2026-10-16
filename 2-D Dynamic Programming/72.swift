class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1)
        let b = Array(word2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: b.count + 1), count: a.count + 1)
        for i in 0...a.count { dp[i][0] = i }
        for j in 0...b.count { dp[0][j] = j }
        for i in stride(from: 1, through: a.count, by: 1) {
            for j in stride(from: 1, through: b.count, by: 1) {
                dp[i][j] = a[i - 1] == b[j - 1]
                    ? dp[i - 1][j - 1]
                    : 1 + min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1])
            }
        }
        return dp[a.count][b.count]
    }
}
