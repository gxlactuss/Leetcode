class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let a = Array(str1)
        let b = Array(str2)
        let n = a.count
        let m = b.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
        for i in 1...n {
            for j in 1...m {
                dp[i][j] = a[i - 1] == b[j - 1] ? dp[i - 1][j - 1] + 1 : max(dp[i - 1][j], dp[i][j - 1])
            }
        }
        var result = [Character]()
        var i = n
        var j = m
        while i > 0 && j > 0 {
            if a[i - 1] == b[j - 1] {
                result.append(a[i - 1])
                i -= 1
                j -= 1
            } else if dp[i - 1][j] >= dp[i][j - 1] {
                result.append(a[i - 1])
                i -= 1
            } else {
                result.append(b[j - 1])
                j -= 1
            }
        }
        result += a[..<i].reversed()
        result += b[..<j].reversed()
        return String(result.reversed())
    }
}
